<#import "parts/template.ftl" as t>

<@t.page>
<h1>MAIN PAGE</h1>
<div>
   <#if teacher??>
   <div>${teacher.firstName}</div>
   <div>${teacher.lastName}</div>
   <div>${teacher.patronymic}</div>
   <div>${teacher.position.position}</div>
   <h3>Группы:</h3>
   <div><#list teacher.groups as group>
       <div>${group.name}</div>
       </#list>
   </div>
   <#elseif child??>
    <div>${child.firstName}</div>
   <div>${child.lastName}</div>
   <div>${child.patronymic}</div>
   <h3>Группа:</h3>
   <div>${child.group.name}</div>
   <#else>
   <div>Hello, admin</div>
   </#if>
</div>
</@t.page>
