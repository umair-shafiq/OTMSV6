/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otms.model;

/**
 *
 * @author Umair Shafiq
 */
public class Task {

    private int id;
    private String name;
    private String description;
    private String sdate;
    private String edate;
    private String assignBy;
    private String assignEmp;
    private String status;
    private int emp_id;
    private int man_id;
    private String comment;
    private int priority;
    

    public Task() {
    }

    public Task(int id, String name, String description, String sdate, String edate, String assignBy, String assignEmp, String status, int emp_id, int man_id, String comment, int priority) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.sdate = sdate;
        this.edate = edate;
        this.assignBy = assignBy;
        this.assignEmp = assignEmp;
        this.status = status;
        this.emp_id = emp_id;
        this.man_id = man_id;
        this.comment = comment;
        this.priority = priority;
    }

    public Task(String name, String description, String sdate, String edate, String assignBy, String assignEmp, String status, int emp_id, int man_id, String comment, int priority) {
        this.name = name;
        this.description = description;
        this.sdate = sdate;
        this.edate = edate;
        this.assignBy = assignBy;
        this.assignEmp = assignEmp;
        this.status = status;
        this.emp_id = emp_id;
        this.man_id = man_id;
        this.comment = comment;
        this.priority = priority;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSdate() {
        return sdate;
    }

    public void setSdate(String sdate) {
        this.sdate = sdate;
    }

    public String getEdate() {
        return edate;
    }

    public void setEdate(String edate) {
        this.edate = edate;
    }

    public String getAssignEmp() {
        return assignEmp;
    }

    public void setAssignEmp(String assignEmp) {
        this.assignEmp = assignEmp;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getAssignBy() {
        return assignBy;
    }

    public void setAssignBy(String assignBy) {
        this.assignBy = assignBy;
    }

    public int getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(int emp_id) {
        this.emp_id = emp_id;
    }

    public int getMan_id() {
        return man_id;
    }

    public void setMan_id(int man_id) {
        this.man_id = man_id;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }
    
    

}
