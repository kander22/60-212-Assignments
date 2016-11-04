Table data_table;
Table final_table;
Table times_table;

int ridesPerDay[];

void setup() {
  data_table = loadTable("Q3data.tsv", "header");
  final_table = new Table();
  noLoop();
  ridesPerDay = new int[89];
}


void draw() {
  for (TableRow row : data_table.rows()) {
    String aStartTime = row.getString("Starttime"); //"7/1/2015 0:44";
    int indexOfFirstSlash = aStartTime.indexOf("/");
    String monthString = aStartTime.substring(0, indexOfFirstSlash); 
    int indexOfLastSlash = aStartTime.lastIndexOf("/");
    String dayString = aStartTime.substring(1+indexOfFirstSlash, indexOfLastSlash); 
    int monthInt = int( monthString);
    int dayInt = int(dayString); 
    // println(monthInt, " ", dayInt);
    int dayOfQuarter = 0; 
    if (monthInt == 7) {
      dayOfQuarter = dayInt-1;
    } else if (monthInt == 8) {
      dayOfQuarter = 30 + (dayInt-1);
    } else if (monthInt == 9) {
      dayOfQuarter = 30+30 + (dayInt-1);
    }
    //println( dayOfQuarter); 
    ridesPerDay[dayOfQuarter]++;
  }
  //saveTable(final_table, "final_table.tsv");
  //println(ridesPerDay); 
  for (int i = 0; i <89; i++) {
    print(ridesPerDay[i], "\n");
  }
}