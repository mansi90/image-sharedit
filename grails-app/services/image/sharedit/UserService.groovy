package image.sharedit

import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException

@Transactional
class UserService {
    def messageSource

    void saveUserAndItsRole(User userInstance, def roles) {
        try {
            userInstance.save(flush: true)
            Set<Role> oldRoles = userInstance?.authorities
            if (roles?.class == java.lang.String) {
                oldRoles ? removeRoles(userInstance, oldRoles) : ''
                new UserRole(user: userInstance, role: Role.findByAuthority(roles)).save(failOnError: true, flush: true)
            } else {
                Set<Role> newRoles = Role.findAll { roles.contains(it.authority) }.toSet()
                if ((newRoles != oldRoles) && newRoles && oldRoles) {
                    removeRoles(userInstance, oldRoles)
                    addRoles(userInstance, newRoles)
                } else if ((!oldRoles) && newRoles) {
                    addRoles(userInstance, newRoles)
                }
            }
        } catch (e) {
            e.printStackTrace(System.out)
        }
    }

    def addRoles(User user, Set<Role> roles) {
        roles?.each {
            new UserRole(user: user, role: it).save(failOnError: true, flush: true)
        }
    }

    def removeRoles(User user, Set<Role> roles) {
        List<UserRole> userRoleToBeRemoved = UserRole.findAllByRoleInListAndUser(roles as List, user)
        userRoleToBeRemoved.each { UserRole userRole ->
            userRole.delete(flush: true)
        }
    }

    def verifyUser(User userInstance, AuthenticateUser authenticateUser) {
        userInstance?.enabled = true
        userInstance.save(flush: true)
        authenticateUser.delete(flush: true)
    }

    String deleteUser(User userInstance) {
        String name = userInstance?.firstName, message
        try {
            UserRole.findAllByUser(userInstance).each { UserRole userRole ->
                userRole.delete(flush: true)
            }
            userInstance.delete(flush: true)
            message = messageSource.getMessage('default.deleted.message', ['User', name].toArray(), Locale.default)
        }
        catch (DataIntegrityViolationException e) {
            message = messageSource.getMessage('default.not.deleted.message', ['User', name].toArray(), Locale.default)
        }

        return message
    }
}
