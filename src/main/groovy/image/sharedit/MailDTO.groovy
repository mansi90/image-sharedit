package image.sharedit

import grails.validation.Validateable

//@Validateable
class MailDTO {
    String html
    Boolean hasHtmlBody = false
    String subject
    String from
    String tos
    String view
    Map model

    static constraints = {
        tos nullable: false, blank: false, validator: { val, obj ->
            return (obj.tosList.every { !(it.toString().length() > 5) })
        }
    }

    List<String> getTosList() {
        return (tos?.tokenize(',')?.findAll { it }?.unique())
    }
}
