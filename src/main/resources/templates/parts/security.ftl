<#assign
    known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign 
            user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
             isAdmin = user.isAdmin()
             isTeacher = user.isTeacher()
             isChild = user.isChild()
     >
        <#if user.isTeacher()>
            <#assign name = user.getTeacher().getFullName()>
        <#elseif user.isChild()>
            <#assign name = user.getChild().getFullName()>
        <#else>
            <#assign name = user.getUsername()>
        </#if>
        
       
        
   
<#else>
    <#assign
        name = "Guest"
        isAdmin = false
        isTeacher = false
        isChild = false
    >
</#if>
        
    
