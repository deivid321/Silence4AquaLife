/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webfest.silence4aqualife;

import java.io.File;
import java.sql.Time;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;


/**
 *
 * @author vdeiv
 */
@javax.persistence.Entity
public class Record {
    
    @Id
    @GeneratedValue
    private long id;
    
    private String name; 
    private String surname; 
    private String recordDate; 
    private String time; 
    private double lng;
    private double lat;
    private String audioName;
    private String csvName;

    public String getAudioName() {
        return audioName;
    }

    public void setAudioName(String audioName) {
        this.audioName = audioName;
    }

    public String getCsvName() {
        return csvName;
    }

    public void setCsvName(String csvName) {
        this.csvName = csvName;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    private File soundFile, movFile;
    
    public Record(){
        
    }
    
    public Record(String name){
     this.name = name;   
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(String recordDate) {
        this.recordDate = recordDate;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public File getSoundFile() {
        return soundFile;
    }

    public void setSoundFile(File soundFile) {
        this.soundFile = soundFile;
    }

    public File getMovFile() {
        return movFile;
    }

    public void setMovFile(File movFile) {
        this.movFile = movFile;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
    
}
