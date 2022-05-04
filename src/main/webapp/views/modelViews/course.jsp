<%@ page import="ua.university.models.Teacher" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if (request.getAttribute("objectName") == "Course" && request.getAttribute("delete_id") == null) { %>
<form action="/courses" method="post">
    <div class="form-group">
        <label for="nameField">Name</label>
        <input type="text" class="form-control" id="nameField" placeholder="Enter name" required>
    </div>
    <div class="form-group">
        <label for="maxGradeField">Max grade</label>
        <input type="number" class="form-control" id="maxGradeField" placeholder="Enter max grade" required>
    </div>
    <div class="form-group">
        <label for="teacherField">Teacher</label>
        <select name="teacher_id" id="teacherField" class="form-control">
            <% for (Teacher teacher: (List<Teacher>) request.getAttribute("teacherList")) { %>
            <option value="<%=teacher.getId()%>"> <%=teacher.getName().toString()%> </option>
            <% } %>
        </select>
    </div>
    <%  session.setAttribute("action", "POST"); %>
    <input type="submit" class="btn btn-primary" value="Add!" />
</form>
<%--<form action="/courses" method="post">--%>
<%--    <br>--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <td>Name:</td>--%>
<%--            <td><input type="text" name="name" required/></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>MaxGrade:</td>--%>
<%--            <td><input type="text" name="maxGrade" required/></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Select Teacher:</td>--%>
<%--            <td>--%>
<%--                <select name="teacher_id">--%>
<%--                    <% for (Teacher teacher: (List<Teacher>) request.getAttribute("teacherList")) { %>--%>
<%--                    <option value="<%=teacher.getId()%>"> <%=teacher.getName().toString()%> </option>--%>
<%--                    <% } %>--%>
<%--                </select>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--    <%  session.setAttribute("action", "POST"); %>--%>
<%--    <input type="submit" value="Add!" />--%>
<%--</form>--%>
<% } %>


<% if (request.getAttribute("objectName") == "Course" && request.getAttribute("delete_id") != null) { %>
<form action="/courses" method="post">
    <% session.setAttribute("action", "DELETE"); %>
    <% session.setAttribute("delete_id", request.getAttribute("delete_id")); %>
    <input type="submit" value="Delete" />
</form>
<% } %>
