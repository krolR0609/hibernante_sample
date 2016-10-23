/**
 * Created by nickolas on 22.10.16.
 */
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

public class Stuff {
    private int id;
    private String type;
    private String description;
    private Date date;

    public Stuff() {}

    public Stuff( String type, String description, Date date) {
        this.type = type;
        this.description = description;
        this.date = Calendar.getInstance().getTime();

    }
    public int getId() {
        return id;
    }
    public void setId( int id ) {
        this.id = id;
    }
    public String getType() {
        return type;
    }
    public void setType( String type ) {
        this.type = type;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription( String description ) {
        this.description = description;
    }
    public Date getDate() {
        return date;
    }
    public void setDate( Date date ) {
        this.date = date;
    }

}
