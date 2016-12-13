package image.sharedit

import grails.transaction.Transactional

@Transactional
class EmailService {
    def mailService
    def grailsApplication

    void sendMyMail(MailDTO mailDTO) {
        mailService.sendMail {
            to mailDTO.tos
            subject mailDTO.subject
            if (mailDTO.hasHtmlBody) {
                html mailDTO.html
            } else {
                body(view: mailDTO.view, model: mailDTO.model)
            }
        }
    }

    String createAuthenticationToken(User userInstance) {
        AuthenticateUser authenticateUser = AuthenticateUser.findByUser(userInstance) ?: new AuthenticateUser(user: userInstance)
        authenticateUser.token = UUID.randomUUID().toString()
        authenticateUser.save(flush: true)
        return authenticateUser.token
    }

    void sendConfirmUserLink(User userInstance) {
        MailDTO mailDTO = new MailDTO(
                tos: userInstance.email,
                subject: "Hello ${userInstance.username}, Please verify your account",
                view: '/email/confirmUser', model: [user: userInstance, token: createAuthenticationToken(userInstance)]
        )
        sendMyMail(mailDTO)
    }
}
