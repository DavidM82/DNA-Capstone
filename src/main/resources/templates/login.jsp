<!DOCTYPE html>
<html>
<head>
    <head th:insert="fragments.html :: headerfiles">
</head>
<body>
    <div class="container p-2">
        <div class="col-xs-3 text-center">
            <form class="form-signin" method="post" action="/login">
                <h2>Log In</h2>
                <input type="text" id="username" name="username" class="form-control" placeholder="Username">
                <input type="password" id="password" name="password" class="form-control" placeholder="Password">
                <p th:if="${param.error}" style="color: red;">Invalid credentials, please try again</p>
                <button class="btn-lg btn-primary btn-block p-2" type="submit">Login</button>
            </form>
            <a class="btn-link btn-lg" href="/registration">New User? Register Here</a>
        </div>
    </div>
    
    <div th:replace="fragments.html :: footer"></div>
</body>
</html>