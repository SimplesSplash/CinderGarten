<#import "parts/template.ftl" as t>

<@t.page>
<#list groups>
<#items as group>
    <div class="card" style="width: 18rem;">
  
  <div class="card-body">
    <h5 class="card-title">${group.name}</h5>  
    <a href="/reports/${group.id}" class="btn btn-primary">Создать отчет</a>
  </div>
</div>
</#items>
</#list>


</@t.page>
