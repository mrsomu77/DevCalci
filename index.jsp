<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP Calculator</title>
</head>
<body>
    <h2>Simple Calculator</h2>
    <form method="post" action="">
        <label>Number 1:</label>
        <input type="number" name="num1" step="any" required>
        <br><br>
        <label>Number 2:</label>
        <input type="number" name="num2" step="any" required>
        <br><br>
        <label>Operation:</label>
        <select name="operation">
            <option value="add">Addition</option>
            <option value="subtract">Subtraction</option>
            <option value="multiply">Multiplication</option>
            <option value="divide">Division</option>
        </select>
        <br><br>
        <input type="submit" value="Calculate">
    </form>

    <%
        // Get input values
        String num1 = request.getParameter("num1");
        String num2 = request.getParameter("num2");
        String operation = request.getParameter("operation");
        double result = 0;
        boolean validOperation = true;

        // Check if numbers are provided
        if (num1 != null && num2 != null) {
            try {
                double n1 = Double.parseDouble(num1);
                double n2 = Double.parseDouble(num2);

                // Perform calculation based on the selected operation
                switch (operation) {
                    case "add":
                        result = n1 + n2;
                        break;
                    case "subtract":
                        result = n1 - n2;
                        break;
                    case "multiply":
                        result = n1 * n2;
                        break;
                    case "divide":
                        if (n2 != 0) {
                            result = n1 / n2;
                        } else {
                            out.println("<p style='color:red;'>Error: Cannot divide by zero.</p>");
                            validOperation = false;
                        }
                        break;
                    default:
                        out.println("<p style='color:red;'>Invalid operation selected.</p>");
                        validOperation = false;
                        break;
                }

                // Display result
                if (validOperation) {
                    out.println("<h3>Result: " + result + "</h3>");
                }
            } catch (NumberFormatException e) {
                out.println("<p style='color:red;'>Error: Please enter valid numbers.</p>");
            }
        }
    %>
</body>
</html>