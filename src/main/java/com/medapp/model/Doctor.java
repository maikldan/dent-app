package com.medapp.model;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by andrei on 25.04.2016.
 */
@Entity
public class Doctor implements Serializable {

  private static final long serialVersionUID = -7669277357339027933L;
  @OneToMany(mappedBy = "doctor", orphanRemoval = true)
  @LazyCollection(LazyCollectionOption.FALSE)
  private List<Meeting> meetings;
  @OneToMany(mappedBy = "doctor", orphanRemoval = true)
  @LazyCollection(LazyCollectionOption.FALSE)
  private List<WorckTime> worckTimes;
  @Id
  @GeneratedValue
  private int doctorId;
  @Column(name = "Name")
  @NotEmpty(message = "The customer name must not be null.")
  private String doctorName;
  @Column(name = "Surname")
  private String doctorSurname;
  @Column(name = "Email")
  @NotEmpty(message = "The customer email must not be null.")
  private String doctorEmail;
  @Column(name = "phone")
  private String doctorPhone;
  @Column(name = "Skayp")
  private String doctorSkayp;
  @Column(name = "Degree")
  private String doctorDegree;
  @Transient
  private MultipartFile doctorImage;
  private boolean enabled;
  @OneToOne
  @JoinColumn(name = "usersId")
  private Users users;

  private String about;

  public int getDoctorId() {
    return doctorId;
  }

  public void setDoctorId(int doctorId) {
    this.doctorId = doctorId;
  }

  public String getDoctorName() {
    return doctorName;
  }

  public void setDoctorName(String doctorName) {
    this.doctorName = doctorName;
  }

  public String getDoctorSurname() {
    return doctorSurname;
  }

  public void setDoctorSurname(String doctorSurname) {
    this.doctorSurname = doctorSurname;
  }

  public String getDoctorEmail() {
    return doctorEmail;
  }

  public void setDoctorEmail(String doctorEmail) {
    this.doctorEmail = doctorEmail;
  }

  public String getDoctorPhone() {
    return doctorPhone;
  }

  public void setDoctorPhone(String doctorPhone) {
    this.doctorPhone = doctorPhone;
  }

  public String getDoctorSkayp() {
    return doctorSkayp;
  }

  public void setDoctorSkayp(String doctorSkayp) {
    this.doctorSkayp = doctorSkayp;
  }

  public String getDoctorDegree() {
    return doctorDegree;
  }

  public void setDoctorDegree(String doctorDegree) {
    this.doctorDegree = doctorDegree;
  }

  public boolean isEnabled() {
    return enabled;
  }

  public void setEnabled(boolean enabled) {
    this.enabled = enabled;
  }

  public Users getUsers() {
    return users;
  }

  public void setUsers(Users users) {
    this.users = users;
  }

  public List<Meeting> getMeetings() {
    return meetings;
  }

  public void setMeetings(List<Meeting> meetings) {
    this.meetings = meetings;
  }

  public MultipartFile getDoctorImage() {
    return doctorImage;
  }

  public void setDoctorImage(MultipartFile doctorImage) {
    this.doctorImage = doctorImage;
  }

  public List<WorckTime> getWorckTimes() {
    return worckTimes;
  }

  public void setWorckTimes(List<WorckTime> worckTimes) {
    this.worckTimes = worckTimes;
  }

  public String getAbout() {
    return about;
  }

  public void setAbout(String about) {
    this.about = about;
  }
}
