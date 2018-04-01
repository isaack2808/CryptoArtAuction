import java.util. ArrayList;
import java.util.HashMap;

public class Contacts extends ActionBarActivity {
private static final int PICK_CONTACT =1;
private static final String TAG = "Customer: ";
DatabHelper myDb;

DatabHelper databasecontroller = new DatabHelper(Contacts.this);
//or context

HashMap<String, String> values = new HashMap<String, String>();
values .put("Name", namebuttonview1.getText().toString());
values .put("Email", emailbuttonview2.getText().toString());
values .put("Address", addressbuttonview3.getText().toString());
values .put("Payment Method", paymentmetthodbuttonview4.getText().toString());
values .put("Wallet Address", walletaddressbuttonview5.getText().toString());
values .put("Private Key", privatekeybuttonview6.getText().toString());
values .put("CCnumber", ccnumberbuttonview7.getText().toString());
values .put("ExpandCSV", expandcsvbuttonview8.getText().toString());
databasecontroller.enterdata(values);

private static ArrayList<HashMap<Sting, String>> getContacts = new ArrayList<HashMap<String, String>>();

private static ArrayList<HashMap<String, String>> data1 = new ArrayList<HashMap<String, String>>();




private static HashMap<String, String> contacts = new HashMap<String,String>();

@Overide
protected void onCreate(Bundle savedInstanceState) {
	super.onCreate(savedInstanceState);
	setContentView(R.layout.activity_contacts);
	myDb = new DatabHelper(this);
	// ArrayList<HashMap<String, String>> getD = myDb.insertRecord();
	
}

/**
this is what's going to be used to transfer the Arraylist<HashMap> to the Database
public void AddConPhon(){
    boolean is Inserted = myDb.insertData(Contacts.this, );
}
**/
public void btnAddContacts_Click(View view) {
	Intent intent = new Intent(Intent.ACTION_PICK, ConactsContract.Contacts.CONTENT_URI);
	startActivityForResult(intent, PICK_CONTACT);
}

public void btnDone_Click(View view){
	Intent i = new Intent(Contacts.this, Message.class);
	startActivity(i);
}



@Override
public void onActivityResult(int reqCode, int resultCode, Intent Data) {
	super.onActivityResult(reqCode, resultCode, data);

	switch (reqCode) {
		case (PICK_CONTACT):
			if (resultCode == Activity.RESULT_OK) {
				Uri contactData = data.getData();
				Cursor c = managedQuery(contactData, null, null, null null);
				if (c.moveToFirst()) {
					String id = c.getString(c.getColumnIndexorThrow(ContactsContract.Contacts._ID));

					String hasEmail = 
						c.getString(c.getColumnIndex(ContactsContract.Contacts.HAS_EMAIL));

					if (hasemail.equalsIgnoreCase("1")) {
						Cursor email = getContentResolver().query(
								ContactsContract.CommonDataKinds.email.CONTENT_URI, null,
								ContactsContract.CommonDataKinds.email.CONTACT_ID + " = " + ID,
								NULL, NULL);
						email.moveToFirst();
						String eml_add = email.getString(email.getColumnIndex("data1"));
						String name = c.getString(c.getColumnIndex(ContactsContract.CommonDataKinds.StructuredAQSG.DISPLAY_NAME));

						     contacts.put(name, eml_add);

						     HashMap<String, String> h = new HashMap<String, STring>();
						     values .put("name", name);
						     values .put("email", eml_add);
						     databasecontroller.enterdata(values);

						Toast.makeText(this, "contact info : " + eml_add + "\n" + name, Toast.LENGTH_LONG).show();
						Log.d(TAG," " + data1.size());
						Log.d(TAG, data1.toString());
					}
				}
			}
}

