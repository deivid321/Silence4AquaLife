package webfest.silence4aqualife;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author vdeiv
 */
public class RecordService {

    private SqlRecordDatabase recDatabase = new SqlRecordDatabase("RecordsPU");
    
    public RecordService(String hi){
    }

    public void addRecord(Record rec) {
        recDatabase.add(rec);
    }

    public void updateRecord(Record rec) {
        recDatabase.update(rec);
    }

    public List<Record> getRecordsList() {
        try {
            return recDatabase.read();
        } catch (DatabaseException ex) {
            Logger.getLogger(RecordService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void removeRecord(Record rec) {
        try {
            recDatabase.delete(rec.getId());
        } catch (DatabaseException ex) {
            Logger.getLogger(RecordService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Record getRecord(long id) {
        return recDatabase.getRecordById(id);
    }

    public void closeConnection() throws DatabaseException {
        recDatabase.closeConnection();
    }
}
