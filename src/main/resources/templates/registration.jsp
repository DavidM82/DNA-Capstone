<!DOCTYPE html>
<html>
<head>
    <head th:insert="fragments.html :: headerfiles">
</head>
<body>
    <div class="container p-2">
        <div class="col-xs-3 text-center">
            <form class="form-signin" th:action="@{/registration}" th:object="${user}" method="post">
                <h2>Registration Form</h2>
                <input type="text" th:field="*{username}" placeholder="Username" class="form-control" aria-describedby="passwordHelpInline">
                <small id="passwordHelpInline" class="text-muted">Must be at least 5 characters long</small>
                <label th:if="${#fields.hasErrors('username')}" th:errors="*{username}" class="validation-message" style="color: red;"></label>
                <br><span class="text-danger" th:utext="${failMessage}"></span>

                <input type="email" th:field="*{email}" placeholder="Email" class="form-control">
                <label th:if="${#fields.hasErrors('email')}" th:errors="*{email}" class="validation-message" style="color: red;"></label>

                <input type="number" required th:field="*{phoneNumber}" placeholder="Phone number" class="form-control">
                <label th:if="${#fields.hasErrors('phoneNumber')}" th:errors="phoneNumber" class="validation-message" style="color: red;"></label>

                <input type="password" th:field="*{password}" placeholder="Password" class="form-control" aria-describedby="passwordHelpInline">
                <small id="passwordHelpInline" class="text-muted">Must be at least 5 characters long</small>
                <label th:if="${#fields.hasErrors('password')}" th:errors="*{password}" class="validation-message" style="color: red;"></label>

                <button type="submit" class="btn-primary btn-lg p-2">Register User</button>
                <h3 class="text-success" th:utext="${successMessage}"></h3>
            </form>
            <a class="btn-link btn-lg" href="/login">Return to Login</a>
        </div>
    </div>

    <div th:replace="fragments.html :: footer"></div>
</body>
</html> 