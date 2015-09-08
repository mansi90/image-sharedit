cloudinary {
    cloudName = 'image-sharedit'
    apiKey = '838529736637296'
    apiSecret = 'HxMgZQqgjsDI70SxiuQWkUIcpoQ'
    baseDeliveryUrl = 'http://res.cloudinary.com/image-sharedit'
    secureDeliveryUrl = 'https://res.cloudinary.com/image-sharedit'
    apiBaseUrl = 'https://api.cloudinary.com/v1_1/image-sharedit'
}
grails.plugin.springsecurity.password.algorithm = 'bcrypt'
grails.plugin.springsecurity.logout.postOnly = false

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'image.sharedit.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'image.sharedit.UserRole'
grails.plugin.springsecurity.authority.className = 'image.sharedit.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
        '/':                ['permitAll'],
        '/user/**':         ['ROLE_ADMIN'],
        '/userRole/**':     ['ROLE_ADMIN'],
        '/role/**':         ['ROLE_ADMIN'],
        '/image/**':        ['ROLE_ADMIN','ROLE_USER'],
        '/error':           ['permitAll'],
        '/index':           ['permitAll'],
        '/index.gsp':       ['permitAll'],
        '/shutdown':        ['permitAll'],
        '/assets/**':       ['permitAll'],
        '/**/js/**':        ['permitAll'],
        '/**/css/**':       ['permitAll'],
        '/**/images/**':    ['permitAll'],
        '/**/favicon.ico':  ['permitAll']
]
