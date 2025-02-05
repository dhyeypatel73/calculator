<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Advanced Calculator</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
            margin-bottom: 5px;
        }
        input[type="number"], select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 10px;
            width: calc(100% - 24px);
            margin: 5px 12px;
        }
        input[type="submit"] {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 80px;
            align-self: center;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .result {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Advanced Calculator</h2>
        <form method="post">
            <label for="num1">Number 1:</label>
            <input type="number" id="num1" name="num1" required>
            <label for="num2">Number 2:</label>
            <input type="number" id="num2" name="num2" required>
            <label for="operation">Operation:</label>
            <select id="operation" name="operation" required>
                <option value="add">Addition</option>
                <option value="subtract">Subtraction</option>
                <option value="multiply">Multiplication</option>
                <option value="divide">Division</option>
            </select>
            <input type="submit" value="Calculate">
        </form>

        <%
            String num1Str = request.getParameter("num1");
            String num2Str = request.getParameter("num2");
            String operation = request.getParameter("operation");
            if (num1Str != null && num2Str != null && operation != null) {
                try {
                    double num1 = Double.parseDouble(num1Str);
                    double num2 = Double.parseDouble(num2Str);
                    double result = 0;
                    String operationStr = "";

                    switch (operation) {
                        case "add":
                            result = num1 + num2;
                            operationStr = "Addition";
                            break;
                        case "subtract":
                            result = num1 - num2;
                            operationStr = "Subtraction";
                            break;
                        case "multiply":
                            result = num1 * num2;
                            operationStr = "Multiplication";
                            break;
                        case "divide":
                            if (num2 != 0) {
                                result = num1 / num2;
                                operationStr = "Division";
                            } else {
                                out.println("<div class='result'><h3>Error: Division by zero is not allowed.</h3></div>");
                                return;
                            }
                            break;
                    }

                    out.println("<div class='result'><h3>Result of " + operationStr + ": " + result + "</h3></div>");
                } catch (NumberFormatException e) {
                    out.println("<div class='result'><h3>Error: Invalid input. Please enter valid numbers.</h3></div>");
                }
            }
        %>
    </div>
</body>
</html>
