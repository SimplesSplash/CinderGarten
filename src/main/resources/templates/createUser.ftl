<#import "parts/template.ftl" as t>

<@t.page>
 <form action=""  class="d-inline-block mw-75" method="post">
        <div class="form-group">
            <input id="login-form" class="form-control " type="text" name="username" placeholder="User name">            
        </div>
        
        <div class="form-group "> 
            <input id="pass-form" class="form-control" type="text" name="firstName" placeholder="Имя">
        </div>
     <div class="form-group "> 
            <input id="pass-form" class="form-control" type="text" name="lastName" placeholder="Фамилия">
        </div>
     <div class="form-group "> 
            <input id="pass-form" class="form-control" type="text" name="patronymic" placeholder="Отчество">
        </div>
        
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div>
            <button type="submit" class="btn btn-primary mr-2"  />Создать</button>
        </div>
        
       
    </form>   
</@t.page>
