/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otms.model;

/**
 *
 * @author Umair Shafiq
 */
public class SubTask {

    private int id;
    private int taskId;
    private String SubtaskName;
    private String SubTaskDescription;
    private String SubTaskStatus;

    public SubTask() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public String getSubtaskName() {
        return SubtaskName;
    }

    public void setSubtaskName(String SubtaskName) {
        this.SubtaskName = SubtaskName;
    }

    public String getSubTaskDescription() {
        return SubTaskDescription;
    }

    public void setSubTaskDescription(String SubTaskDescription) {
        this.SubTaskDescription = SubTaskDescription;
    }

    public String getSubTaskStatus() {
        return SubTaskStatus;
    }

    public void setSubTaskStatus(String SubTaskStatus) {
        this.SubTaskStatus = SubTaskStatus;
    }

}
