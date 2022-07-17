import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: TestPerformanceApp(),
      ),
    ),
  );
}

class TestPerformanceApp extends StatefulWidget {
  const TestPerformanceApp({super.key});

  @override
  State<TestPerformanceApp> createState() => _TestPerformanceAppState();
}

class _TestPerformanceAppState extends State<TestPerformanceApp> {
  DataRowHeightStyle _dataRowHeightStyle = const DataRowHeightStyle.auto(verticalPadding: 0);
  int _numberOfRowsToGenerate = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 50, width: 1),
        Row(children: [
          OutlinedButton(
            onPressed: () {
              setState(() {
                _numberOfRowsToGenerate = 10;
                _dataRowHeightStyle = const DataRowHeightStyle.auto(verticalPadding: 0);
              });
            },
            child: const Text("10 rows auto"),
          ),
          OutlinedButton(
            onPressed: () {
              setState(() {
                _numberOfRowsToGenerate = 10;
                _dataRowHeightStyle = const DataRowHeightStyle.fixed(height: 60);
              });
            },
            child: const Text("10 rows fixed"),
          ),
          OutlinedButton(
            onPressed: () {
              setState(() {
                _numberOfRowsToGenerate = 100;
                _dataRowHeightStyle = const DataRowHeightStyle.auto(verticalPadding: 0);
              });
            },
            child: const Text("100 rows auto"),
          ),
          OutlinedButton(
            onPressed: () {
              setState(() {
                _numberOfRowsToGenerate = 100;
                _dataRowHeightStyle = const DataRowHeightStyle.fixed(height: 60);
              });
            },
            child: const Text("100 rows fixed"),
          )
        ]),
        if (_numberOfRowsToGenerate > 0)
          TestDataTable(dataRowHeightStyle: _dataRowHeightStyle, numberOfRowsToGenerate: _numberOfRowsToGenerate)
      ],
    );
  }
}

class TestDataTable extends StatelessWidget {
  const TestDataTable({required this.dataRowHeightStyle, required this.numberOfRowsToGenerate, super.key});

  final DataRowHeightStyle dataRowHeightStyle;
  final int numberOfRowsToGenerate;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showBottomBorder: true,
      //dataRowHeight: 40,
      dataRowHeightStyle: dataRowHeightStyle, //const DataRowHeightStyle.auto(verticalPadding: 0),
      headingRowHeight: 30,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Name',
          ),
        ),
        DataColumn(
          label: Text(
            'Age',
          ),
        ),
        DataColumn(
          label: Text(
            'Role',
          ),
        ),
      ],
      rows: <DataRow>[
        for (var i = 0; i < numberOfRowsToGenerate; i++) ...[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Sarah')),
              DataCell(Text('19')),
              DataCell(Text('Student')), //  very long long long long long long long longlong long long long
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Janine')),
              DataCell(Text('43')),
              DataCell(Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Text("Professor"),
                    Text("Professor"),
                    Text("Professor"),
                    Text("Professor"),
                  ]))),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('William')),
              DataCell(Text('27')),
              DataCell(Text('Associate Professor')),
            ],
          )
        ],
      ],
    );
  }
}
