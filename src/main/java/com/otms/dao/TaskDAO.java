/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otms.dao;

import com.otms.model.Task;
import com.otms.model.Comment;
import com.otms.model.Notification;
import com.otms.model.SubTask;
import com.otms.model.UploadFile;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Umair Shafiq
 */
public class TaskDAO {

    Connection con = null;
    //Statement stmt = null;
    public int addTask(Task t) throws ClassNotFoundException, SQLException {

        String INSERT_TASKS_SQL = "INSERT INTO tasks" + "( t_name, t_description, t_startDate, t_endDate, t_assignBy, t_status, emp_id, man_id, t_priority) VALUES"
                + "( ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        int result = 0;

        con = db_connection.connect();
        PreparedStatement pst = con.prepareStatement(INSERT_TASKS_SQL, Statement.RETURN_GENERATED_KEYS);

        pst.setString(1, t.getName());
        pst.setString(2, t.getDescription());
        pst.setString(3, t.getSdate());
        pst.setString(4, t.getEdate());
        pst.setString(5, t.getAssignBy());
        pst.setString(6, t.getStatus());
        pst.setInt(7, t.getEmp_id());
        pst.setInt(8, t.getMan_id());
        pst.setInt(9, t.getPriority());
        result = pst.executeUpdate();
        ResultSet rs = pst.getGeneratedKeys();
        int last_inserted_id = 0;
        if (rs.next()) {
             last_inserted_id = rs.getInt(1);
           // System.out.println(last_inserted_id );
        }
           rs.close();
        con = db_connection.connect();
        String msg = "Task has been Assigned to you by manager";
        String sql = "insert into notification (man, emp, task_id, message,for_user) values (?,?,?,?,?)";
        PreparedStatement pre = con.prepareStatement(sql);
        pre.setInt(1, t.getMan_id());
        pre.setInt(2, t.getEmp_id());
        pre.setInt(3, last_inserted_id);
        pre.setString(4, msg);
        pre.setInt(5, t.getEmp_id());
        int res = pre.executeUpdate();
        return result;
    }

    //select all Tasks
    public List<Task> selectAllTasks() throws ClassNotFoundException {
        List<Task> tasks = new ArrayList<Task>();
        Task t = null;
        try (Connection con = db_connection.connect()) {
            String SELECT_ALL_TASKS = "SELECT tasks.id, tasks.t_name, tasks.t_description, tasks.t_startDate, tasks.t_endDate, tasks.t_assignBy, users.u_name, tasks.t_status, tasks.t_priority FROM otms.tasks INNER JOIN otms.users ON users.id = tasks.emp_id;";

            PreparedStatement preparedStatement = con.prepareStatement(SELECT_ALL_TASKS);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                t = new Task();
                t.setId(rs.getInt(1));
                t.setName(rs.getString(2));
                t.setDescription(rs.getString(3));
                t.setSdate(rs.getString(4));
                t.setEdate(rs.getString(5));
                t.setAssignBy(rs.getString(6));
                t.setAssignEmp(rs.getString(7));
                t.setStatus(rs.getString(8));
                t.setPriority(rs.getInt(9));
                tasks.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }

    //Edit Task by ID
    public Task getTaskbyId(int id) throws ClassNotFoundException {
        Task t = null;
        try (Connection con = db_connection.connect()) {
//String sql = "select * from tasks where id=?";
            String sql = "SELECT tasks.id, tasks.t_name, tasks.t_description, tasks.t_startDate, tasks.t_endDate, tasks.t_assignBy, users.u_name, tasks.t_status, tasks.emp_id, tasks.man_id, tasks.t_priority FROM otms.tasks INNER JOIN otms.users ON users.id = tasks.emp_id where tasks.id=?;";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                t = new Task();
                t.setId(rs.getInt(1));
                t.setName(rs.getString(2));
                t.setDescription(rs.getString(3));
                t.setSdate(rs.getString(4));
                t.setEdate(rs.getString(5));
                t.setAssignBy(rs.getString(6));
                t.setAssignEmp(rs.getString(7));
                t.setStatus(rs.getString(8));
                t.setEmp_id(rs.getInt(9));
                t.setMan_id(rs.getInt(10));
                t.setPriority(rs.getInt(11));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return t;
    }

    //Update Tasks
    public int updateTask(Task task) throws ClassNotFoundException, SQLException {
        String UPDATE_TASKS_SQL = "UPDATE tasks SET t_name=?, t_description=?, t_startDate=?, t_endDate=?,  t_status=?, emp_id=?, t_priority=? WHERE id=?;";
        //   String UPDATE_TASKS_SQL = "UPDATE otms.tasks SET  tasks.t_name=?, tasks.t_description=?, tasks.t_startDate=?, tasks.t_endDate=?, tasks.t_assignBy=?, users.u_name=?, tasks.t_status=?, emp_id=?, man_id=?  INNER JOIN otms.users ON users.id = tasks.emp_id where tasks.id=?;";

        int result = 0;
        con = db_connection.connect();

        PreparedStatement pst = con.prepareStatement(UPDATE_TASKS_SQL);

        pst.setString(1, task.getName());
        pst.setString(2, task.getDescription());
        pst.setString(3, task.getSdate());
        pst.setString(4, task.getEdate());
        pst.setString(5, task.getStatus());
        pst.setInt(6, task.getEmp_id());
        pst.setInt(7, task.getPriority());
        pst.setInt(8, task.getId());

        result = pst.executeUpdate();
        return result;

    }

    //delete Task
    public boolean deleteTask(int id) throws ClassNotFoundException {
        boolean rowDeleted = false;
        try (Connection con = db_connection.connect()) {
            String DELETE_TASKS_SQL = "delete from tasks where id=?;";
            PreparedStatement ps = con.prepareStatement(DELETE_TASKS_SQL);
            ps.setInt(1, id);
            ps.executeUpdate();
            //rowDeleted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    public Task getTaskbyIdForComment(int id) throws ClassNotFoundException {
        Task t = null;
        try (Connection con = db_connection.connect()) {

            //String sql = "select * from tasks where id=?";
            String sql = "SELECT tasks.id, tasks.t_name, tasks.t_description, tasks.t_startDate, tasks.t_endDate, tasks.t_assignBy, users.u_name, tasks.t_status, tasks.emp_id, tasks.man_id FROM otms.tasks INNER JOIN otms.users ON users.id = tasks.emp_id where tasks.id=?;";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                t = new Task();
                t.setId(rs.getInt(1));
                t.setName(rs.getString(2));
                t.setAssignEmp(rs.getString(7));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return t;
    }

    //Upload File
    public int uploadFile(UploadFile f) throws ClassNotFoundException, SQLException {
        con = db_connection.connect();
        String sql = "insert into uploadfile (file_name, task_id, remark) values (?, ?, ?)";
        int result = 0;
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, f.getFileName());
        pst.setInt(2, f.getTaskID());

        pst.setString(3, f.getRemark());

        result = pst.executeUpdate();

        return result;
    }

    //DownloadFIle
//    public UploadFile downloadfile(int id) throws ClassNotFoundException, SQLException {
//         UploadFile f = null;
//        con = db_connection.connect();
//        String sql = "select * from uploadfile where task_id=?";
//       
//        PreparedStatement pst = con.prepareStatement(sql);
//        pst.setInt(1, id);
//        ResultSet rs = pst.executeQuery();
//
//        while (rs.next()) {
//           f = new UploadFile();
//          f.setId(rs.getInt(1));
//            f.setTaskID(rs.getInt(2));
//          f.setFileName(rs.getString(3));
//        
//           
//
//        }
//        return f;
//    }
    //**************************************************************
    public List<UploadFile> Download(int id) throws ClassNotFoundException {
        List<UploadFile> file = new ArrayList<UploadFile>();
        UploadFile f = null;
        try (Connection con = db_connection.connect()) {
            String SELECT_ALL_USERS = "select * from uploadfile where task_id=?";
            PreparedStatement preparedStatement = con.prepareStatement(SELECT_ALL_USERS);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                f = new UploadFile();
                f.setId(rs.getInt(1));
                f.setTaskID(rs.getInt(2));
                f.setFileName(rs.getString(3));
                f.setRemark(rs.getString(4));

                file.add(f);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return file;
    }

    //**************************************************************
    //Get All Tasks by Employee ID .... Login
    public List<Task> getAllTasksByEmpLogin(int EmpId) throws ClassNotFoundException {
        List<Task> tasks = new ArrayList<Task>();
        Task t = null;
        try (Connection con = db_connection.connect()) {
            //String SELECT_ALL_TASKS = "Select * from tasks where emp_id=?";
            String sql = "SELECT tasks.id, tasks.t_name, tasks.t_description, tasks.t_startDate, tasks.t_endDate, tasks.t_assignBy, users.u_name, tasks.t_status, man_id, tasks.t_priority FROM otms.tasks INNER JOIN otms.users ON users.id = tasks.emp_id where emp_id=? ORDER BY tasks.t_priority asc;";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, EmpId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                t = new Task();
                t.setId(rs.getInt(1));
                t.setName(rs.getString(2));
                t.setDescription(rs.getString(3));
                t.setSdate(rs.getString(4));
                t.setEdate(rs.getString(5));
                t.setAssignBy(rs.getString(6));
                t.setAssignEmp(rs.getString(7));
                t.setStatus(rs.getString(8));
                t.setMan_id(rs.getInt(9));
                t.setPriority(rs.getInt(10));
                tasks.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }

    //select all Tasks By Manager ID.....Login
    public List<Task> selectAllTasksByMangerId(int ManId) throws ClassNotFoundException {
        List<Task> tasks = new ArrayList<Task>();
        Task t = null;
        try (Connection con = db_connection.connect()) {
            String SELECT_ALL_TASKS = "SELECT tasks.id, tasks.t_name, tasks.t_description, tasks.t_startDate, tasks.t_endDate, tasks.t_assignBy, users.u_name, tasks.t_status, man_id, tasks.t_priority FROM otms.tasks INNER JOIN otms.users ON users.id = tasks.emp_id where man_id=?;";

            PreparedStatement preparedStatement = con.prepareStatement(SELECT_ALL_TASKS);
            preparedStatement.setInt(1, ManId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                t = new Task();
                t.setId(rs.getInt(1));
                t.setName(rs.getString(2));
                t.setDescription(rs.getString(3));
                t.setSdate(rs.getString(4));
                t.setEdate(rs.getString(5));
                t.setAssignBy(rs.getString(6));
                t.setAssignEmp(rs.getString(7));
                t.setStatus(rs.getString(8));
                t.setMan_id(rs.getInt(9));
                t.setPriority(rs.getInt(10));
                tasks.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }

    //Get Task ID For SubTask
    public Task getTaskIdForSubTask(int id) throws ClassNotFoundException {
        Task t = null;
        try (Connection con = db_connection.connect()) {
            String sql = "select id from tasks where id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                t = new Task();
                t.setId(rs.getInt(1));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return t;
    }

    //Showing Notifications to Employee On Adding Task 
    //****************************************************************************************
    public List<Notification> noti(int id) throws ClassNotFoundException {
        List<Notification> notifications = new ArrayList<Notification>();
        Notification noti = null;
        try (Connection con = db_connection.connect()) {

            String sql = "SELECT message FROM notification where for_user = ? and is_read=1 order by id desc;";
           
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                noti = new Notification();
                noti.setMsg(rs.getString(1));
                notifications.add(noti);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }
    
    //Showing Notifications to Manager On Completing Sub Task 
    //****************************************************************************************
    public List<Notification> complateSubTaskNoti(int id) throws ClassNotFoundException {
        List<Notification> notifications = new ArrayList<Notification>();
        Notification noti = null;
        try (Connection con = db_connection.connect()) {

            String sql = "SELECT msg FROM subtask where for_user = ? and is_completed=1 order by id desc;";
           
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                noti = new Notification();
                noti.setMsg(rs.getString(1));
                notifications.add(noti);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }

}
