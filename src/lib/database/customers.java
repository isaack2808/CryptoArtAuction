import java.util.HashMap;

public class DataHalper extends SQLiteOpenHelper {

public static final String DATABASE_NAME = "AQSG.db";
public static final String TABLE_NAME = "customer_table";
public static final String COL_1 = "Name";
public static final String COL_2 = "Email";
public static final String COL_3 = "Address";
public static final String COL_4 = "Payment Method";
public static final String COL_5 = "Wallet Address";
public static final String COL_6 = "Private Key";
public static final String COL_7 = "CCnumber";
public static final String COL_8 = "ExpandCSV";

public DatabHelper(Context context) {
	super(context, DATABASE_NAME, NULL, 1);

}

@Overide
public void onCreate(SQLiteDatabase db) {
db.execSQL("create table" + TABLE_NAME + "(ID INTEGER PRIMARY KEY AUTOINCREMENT, Address
}

public void inserI(ArrayList<HashMap<String, String>> list1){
	// TODO Auto-generated method stub
	
	SQLiteDatabase db = this.getWritableDatabase();
	ContentValues newValues1 = new ContentValues();

	for(int i=0;i<list1.size();i++{

	newValues1.put(ITEM, list1.get(i).get("names").toString());
	newValues1.put(QUA, list1.get(i).get("email").toString());
	//newValues1.put(RATE,list1.get(i).get(THIRD_COLUMN).toString());
	
	db.insert(QUANTITY, null, newValues1);
}

@Override
public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
db.execSQL("DROP TABLE IF EXISTS" + TABLE_NAME);
onCreate(db);
}

public void enterdata(HashMap<String, String> Vi) {
	SQLiteDatabase database = this.getWritableDatabase();
	ContentValues values = new ContentValues();

	values.put("Name", Vi.get("Name));
	values.put("Email", Vi.get("Email));
	values.put("Address", Vi.get("Address"));
	values.put("Payment Method", Vi.get("Payment Method"));
	values.put("Wallet Address", Vi.get("Wallet Address"));
	values.put("Private Key", Vi.get("Private Key"));
	values.put("CCnumber", Vi.get("CCnumber"));
	values.put("ExpandCSV", Vi.get("ExpandCSV"));

	database.insert("DatabHelper", null, values);
	database.close();
}
