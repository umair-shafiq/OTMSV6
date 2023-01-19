/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otms.model;

/**
 *
 * @author Umair Shafiq
 */
public class User {

    private int id;
    private String name;
    private String email;
    private String dob;
    private String gender;
    private String password;
    private String address;
    private String contact;

    public User() {
        super();
    }

    public User(String name, String email, String dob, String gender, String password, String address, String contact) {
        this.name = name;
        this.email = email;
        this.dob = dob;
        this.gender = gender;
        this.password = password;
        this.address = address;
        this.contact = contact;
    }

    public User(int id, String name, String email, String dob, String gender, String password, String address, String contact) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.dob = dob;
        this.gender = gender;
        this.password = password;
        this.address = address;
        this.contact = contact;
    }

    //Getters
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getDob() {
        return dob;
    }

    public String getGender() {
        return gender;
    }

    public String getPassword() {
        return password;
    }

    public String getAddress() {
        return address;
    }

    public String getContact() {
        return contact;
    }

    //Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

}
