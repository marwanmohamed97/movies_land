import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:movies_land/core/ulits/styles.dart';

import 'package:movies_land/features/home/data/repos/home_repo.dart';
import 'package:movies_land/features/home/data/repos/home_repo_impl.dart';

import '../../../../../constats.dart';

class DownlaodsViewBody extends StatefulWidget {
  const DownlaodsViewBody({Key? key}) : super(key: key);
  final String apiUrl = 'https://api.themoviedb.org/3';
  final String apiKey = '319b1920e86cdd05a805f90bbf1e21b7';
  @override
  State<DownlaodsViewBody> createState() => _DownlaodsViewBodyState();
}

class _DownlaodsViewBodyState extends State<DownlaodsViewBody> {
  String? sessionID;
  @override
  void initState() {
    getSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Center(
          child: Column(
            children: const [
              Text(
                'DownLoads',
                style: Styles.textStyle34,
              )
            ],
          ),
        ),
      ),
    );
  }

  getSession() async {
    final db = FirebaseFirestore.instance;
    db.collection('User').doc('marwanhaker@gmail.com').get().then((value) {
      final data = value.data() as Map<String, dynamic>;

      sessionID = data['Session_ID'];
      return data['Session_ID'];
    });
  }
}
