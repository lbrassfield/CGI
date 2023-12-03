import 'package:flutter/material.dart';

class DynamicDataTable extends StatelessWidget {
  final Map<String, dynamic>
      queryResult; // Replace with your actual query result

  DynamicDataTable(this.queryResult);

  @override
  Widget build(BuildContext context) {
    final List<String> columnNames =
        List<String>.from(queryResult['column_names']);
    final List<List<dynamic>> results =
        List<List<dynamic>>.from(queryResult['results']);

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        child: DataTable(
          columns: columnNames
              .map((columnName) => DataColumn(label: Text(columnName)))
              .toList(),
          rows: results.map((result) {
            return DataRow(
              cells: result.map((cellValue) {
                return DataCell(
                  Text(cellValue.toString()),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
