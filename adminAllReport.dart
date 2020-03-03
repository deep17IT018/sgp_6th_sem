import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:wcmc_project/data/allViewData.dart';
import 'package:wcmc_project/globals.dart'as globals;
import 'package:flutter/services.dart';
bool isLoading = false;
void main(){
  runApp(viewReport());
}

class viewReport extends StatefulWidget {
  @override
  _viewReportState createState() => _viewReportState();
}

class _viewReportState extends State<viewReport> {

  final List<Map<String, String>> mf= [];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("CHARUSAT"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              child: Column(
                  children: <Widget>[
                    DataTable(
              columns: [
              DataColumn(label: Text('Time')),
            DataColumn(label: Text('Loc.-Lab/Class')),
            DataColumn(label: Text('Class')),
//            DataColumn(label: Text('Actual Faculty')),
            DataColumn(label: Text('Subject')),
                DataColumn(label: Text('Conducted By')),
                DataColumn(label: Text('Attendance')),
//                DataColumn(label: Text('Remarks')),
            ],
            rows: getRow(),
    )
    ],
    ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    for(int i=0;i<globals.data7.dayData.length;i++) {
      mf.add({
        "Time":globals.data7.dayData[i].time,
        "Loc.-Lab/Class":globals.data7.dayData[i].locationLabClass,
        "Class":globals.data7.dayData[i].Class,
//        "Actual Faculty":globals.data7.dayData[i].actualFaculty,
        "Subject":globals.data7.dayData[i].subject,
        "Conducted By":globals.data7.dayData[i].conductedBy,
        "Attendance":globals.data7.dayData[i].attendance,
//        "Remarks":globals.data7.dayData[i].remark,

      });

    }

  }

  List<DataRow> getRow() {
    List<DataRow> list = List<DataRow>();
    try {
      for (int counter = 0; counter < mf.length; counter++) {
        list.add(DataRow(
          cells: <DataCell>[
            //Extracting from Map element the value
            DataCell(Text(mf[counter]["Time"])),
            DataCell(Text(mf[counter]["Loc.-Lab/Class"])),
            DataCell(Text(mf[counter]["Class"])),
//            DataCell(Text(mf[counter]["Actual Faculty"])),
            DataCell(Text(mf[counter]["Subject"])),
            DataCell(Text(mf[counter]["Conducted By"])),
            DataCell(Text(mf[counter]["Attendance"])),
//            DataCell(Text(mf[counter]["Remarks"])),


          ],
        ));
      }
    } catch (e) {
    print(e);
    print(mf);
    }
    return list;
  }
}


