import 'package:crime_mapping/component/text_input.dart';
import 'package:crime_mapping/shared/font.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crime_mapping/services/auth.dart';

class Report extends StatefulWidget {
  static final routeName = '/Report';

  @override
  State<StatefulWidget> createState() {
    return _ReportState();
  }
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    TextEditingController namaController = TextEditingController();
    TextEditingController noTelpController = TextEditingController();
    TextEditingController alamatController = TextEditingController();
    TextEditingController keteranganController = TextEditingController();
    List<String> listKejahatan = [
      'Tawuran Warga',
      'Tawuran Gangster',
      'Tawuran Pelajar',
      'Curanmor'
    ];
    var kejahatan = 'Curanmor';

    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(20.0),
        child: Form(
          child: ListView(
            children: [
              //nama
              TextInput(
                controller: namaController,
                hintText: 'Nama Lengkap',
                prefixIcon: Icon(Icons.account_circle),
              ),
              SizedBox(height: 20),
              //notelp
              TextInput(
                controller: noTelpController,
                hintText: 'No Telp',
                prefixIcon: Icon(Icons.phone_android),
              ),
              SizedBox(height: 20),
              //alamat
              TextInput(
                controller: alamatController,
                hintText: 'Alamat',
                prefixIcon: Icon(Icons.add_box),
              ),
              SizedBox(height: 20),
              //keterangan
              TextInput(
                controller: keteranganController,
                hintText: 'Keterangan',
                prefixIcon: Icon(Icons.add_comment),
              ),
              SizedBox(height: 20),
              //kejahatan
              Text(
                'Kejahatan',
                style: blackText.copyWith(fontSize: 22.0),
              ),
              SizedBox(height: 10),
              DropDownField(
                value: kejahatan,
                required: true,
                labelText: 'Pilih Kejahatan',
                items: listKejahatan,
                strict: false,
                setter: (newValue) {
                  setState(() => kejahatan = newValue);
                  //nilaiFocusNode.requestFocus();
                },
              ),
              SizedBox(height: 50),
              //button
              Container(
                height: 60.0,
                child: RaisedButton(
                  child: Text(
                    'SIMPAN',
                    style: blackText.copyWith(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
