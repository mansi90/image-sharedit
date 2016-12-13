cloudinary {
    cloudName = 'image-sharedit'
    apiKey = '838529736637296'
    apiSecret = 'HxMgZQqgjsDI70SxiuQWkUIcpoQ'
    baseDeliveryUrl = 'http://res.cloudinary.com/image-sharedit'
    secureDeliveryUrl = 'https://res.cloudinary.com/image-sharedit'
    apiBaseUrl = 'https://api.cloudinary.com/v1_1/image-sharedit'
}

// Spring Security Configuration
grails.plugin.springsecurity.rejectPublicInvocations = false
grails.plugin.springsecurity.successHandler.alwaysUseDefault = false

grails.plugin.springsecurity.password.algorithm = 'bcrypt'
grails.plugin.springsecurity.logout.postOnly = false

grails.plugin.springsecurity.userLookup.userDomainClassName = 'image.sharedit.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'image.sharedit.UserRole'
grails.plugin.springsecurity.authority.className = 'image.sharedit.Role'
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/image/list'

//grails.plugin.springsecurity.apf.storeLastUsername = true
//grails.plugin.springsecurity.securityConfigType = "InterceptUrlMap"
grails.plugin.springsecurity.interceptUrlMap = [
        [pattern: '/', access: ['permitAll']],
        [pattern: '/error', access: ['permitAll']],
        [pattern: '/index', access: ['permitAll']],
        [pattern: '/index.gsp', access: ['permitAll']],
        [pattern: '/shutdown', access: ['permitAll']],
        [pattern: '/assets/**', access: ['permitAll']],
        [pattern: '/**/js/**', access: ['permitAll']],
        [pattern: '/**/css/**', access: ['permitAll']],
        [pattern: '/**/images/**', access: ['permitAll']],
        [pattern: '/**/favicon.ico', access: ['permitAll']],
        [pattern: '/user/**', access: ['ROLE_ADMIN']],
        [pattern: '/userRole/**', access: ['ROLE_ADMIN']],
        [pattern: '/role/**', access: ['ROLE_ADMIN']],
        [pattern: '/club/**', access: ['ROLE_ADMIN']],
        [pattern: '/clubMember/**', access: ['ROLE_ADMIN']],
        [pattern: '/album/**', access: ['ROLE_ADMIN', 'ROLE_USER']],
        [pattern: '/image/**', access: ['ROLE_ADMIN', 'ROLE_USER']],
        [pattern: '/register', access: ['permitAll']],
        [pattern: '/verifyAccount', access: ['permitAll']],
        [pattern: '/profile', access: ['ROLE_ADMIN', 'ROLE_USER']],
        [pattern: '/gallery', access: ['ROLE_ADMIN', 'ROLE_USER']],
        [pattern: '/dashboard/**', access: ['ROLE_ADMIN', 'ROLE_USER']]
]
grails {
    mail {
        host = "smtp.gmail.com"
        port = 465
        username = "imagesharedit@gmail.com"
        password = "abc123cd98"
        props = ["mail.smtp.auth": "true",
                "mail.smtp.socketFactory.port": "465",
                "mail.smtp.socketFactory.class": "javax.net.ssl.SSLSocketFactory"]
    }
}