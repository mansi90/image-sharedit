package image.sharedit

import grails.transaction.Transactional

@Transactional
class ClubService {

    def createOrUpdateClubMembers(Club clubInstance, def params) {
        clubInstance.save(flush: true)
        if (params.clubMembers) {
            List<String> userIds = (params.clubMembers.class.name == 'java.lang.String') ? [params.clubMembers.toString()] : params.list('clubMembers')
            List<ClubMember> oldMembers = ClubMember.findAllByClub(clubInstance), needToRemove = oldMembers.findAll {
                !userIds.contains(it.user.id.toString())
            }
            needToRemove ? removeClubMembers(needToRemove) : ''
            userIds.each {
                if (!oldMembers*.user*.id?.contains(it.toLong())) {
                    new ClubMember(user: User.get(it.toLong()), club: clubInstance).save(flush: true)
                }
            }
        }
        clubInstance
    }

    def removeClubMembers(List<ClubMember> clubMembers) {
        clubMembers*.delete(flush: true)
    }
}
