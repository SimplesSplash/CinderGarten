<#import "parts/template.ftl" as t>

<@t.page>
<div class="card-columns">
<#list groups>
<#items as group>
    <div class="card text-center" style="width: 18rem; margin: 10px">
  
  <div class="card-body">
    <h3 class="card-title">${group.name}</h3>  
    <a href="/reports/${group.id}" class="btn btn-primary" style="margin: 5px">Создать отчет</a>
    <a href="/reports/${group.id}" class="btn btn-primary">Посмотреть отчеты</a>
  </div>
</div>
 <div class="card text-center" style="width: 18rem; margin: 10px">
  
  <div class="card-body">
    <h3 class="card-title">Зайчики</h3>  
    <a href="/reports/${group.id}" class="btn btn-primary" style="margin: 5px">Создать отчет</a>
    <a href="/reports/${group.id}" class="btn btn-primary">Посмотреть отчеты</a>
  </div>
</div>
 <div class="card text-center" style="width: 18rem; margin: 10px">
  
  <div class="card-body">
    <h3 class="card-title">Рыбки</h3>  
    <a href="/reports/${group.id}" class="btn btn-primary" style="margin: 5px">Создать отчет</a>
    <a href="/reports/${group.id}" class="btn btn-primary">Посмотреть отчеты</a>
  </div>
</div>
 <div class="card text-center" style="width: 18rem; margin: 10px">
  
  <div class="card-body">
    <h3 class="card-title">Васильки</h3>  
    <a href="/reports/${group.id}" class="btn btn-primary" style="margin: 5px">Создать отчет</a>
    <a href="/reports/${group.id}" class="btn btn-primary">Посмотреть отчеты</a>
  </div>
</div>
 <div class="card text-center" style="width: 18rem; margin: 10px">
  
  <div class="card-body">
    <h3 class="card-title">Лисички</h3>  
    <a href="/reports/${group.id}" class="btn btn-primary" style="margin: 5px">Создать отчет</a>
    <a href="/reports/${group.id}" class="btn btn-primary">Посмотреть отчеты</a>
  </div>
</div>
 <div class="card text-center" style="width: 18rem; margin: 10px">
  
  <div class="card-body">
    <h3 class="card-title">Солнышки</h3>  
    <a href="/reports/${group.id}" class="btn btn-primary" style="margin: 5px">Создать отчет</a>
    <a href="/reports/${group.id}" class="btn btn-primary">Посмотреть отчеты</a>
  </div>
</div>
 <div class="card text-center" style="width: 18rem; margin: 10px">
  
  <div class="card-body">
    <h3 class="card-title">Ромашки</h3>  
    <a href="/reports/${group.id}" class="btn btn-primary" style="margin: 5px">Создать отчет</a>
    <a href="/reports/${group.id}" class="btn btn-primary">Посмотреть отчеты</a>
  </div>
     
</div>
<div class="card text-center" style="width: 18rem; margin: 10px">
  
  <div class="card-body">
    <h3 class="card-title">Грибочки</h3>  
    <a href="/reports/${group.id}" class="btn btn-primary" style="margin: 5px">Создать отчет</a>
    <a href="/reports/${group.id}" class="btn btn-primary">Посмотреть отчеты</a>
  </div>
     
</div>
<div class="card text-center" style="width: 18rem; margin: 10px">
  
  <div class="card-body">
    <h3 class="card-title">Капитошки</h3>  
    <a href="/reports/${group.id}" class="btn btn-primary" style="margin: 5px">Создать отчет</a>
    <a href="/reports/${group.id}" class="btn btn-primary">Посмотреть отчеты</a>
  </div>
     
</div>

</#items>
</#list>
</div>

</@t.page>
