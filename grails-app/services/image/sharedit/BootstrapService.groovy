package image.sharedit

import grails.transaction.Transactional

@Transactional
class BootstrapService {

    def createRoles() {
        new Role(authority: "ROLE_ADMIN").save(flush: true)
        new Role(authority: "ROLE_USER").save(flush: true)
    }

    void createUsers() {
        User admin = new User(firstName: 'Mansi', lastName: 'Arora', email: 'mansi.arora@tothenew.com', password: 'password', username:'mansi.arora').save(flush: true, failOnError: true)
        new UserRole(user: admin, role: Role.findByAuthority('ROLE_ADMIN')).save(flush: true, failOnError: true)
        User standard = new User(firstName: 'Neha', lastName: 'Gupta', email: 'neha.gupta@tothenew.com', password: 'password', username: 'neha.gupta').save(flush: true, failOnError: true)
        new UserRole(user: standard, role: Role.findByAuthority('ROLE_USER')).save(flush: true, failOnError: true)
    }
}
