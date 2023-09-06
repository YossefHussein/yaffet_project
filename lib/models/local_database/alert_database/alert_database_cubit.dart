import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'alert_database_state.dart';

class AlertDatabaseCubit extends Cubit<AlertDatabaseCubitState> {
  AlertDatabaseCubit() : super(AlertDatabaseCubitInitialState());

  // this is for doing CRUD operation
  late Database database;

  // all alert save here when getting data
  List<Map> newAlertList = [];

  // this for getting method and variable
  static AlertDatabaseCubit get(BuildContext context) =>
      BlocProvider.of(context);

  // this for creating
  Future<void> createAlertDatabase() async {
    openDatabase('alert.db', version: 1, onCreate: (database, version) {
      database
          .execute(
        'CREATE TABLE yaffetAlert (id INTEGER PRIMARY KEY,weight TEXT, unit TEXT , karatGold TEXT , currency TEXT , price TEXT  , isGold Text , isSilver Text)',
      )
          .then(
        (value) {
          print('database created');
        },
      ).catchError(
        (error) {
          print('error is ${error.toString()}');
        },
      );
    }, onOpen: (database) {
      getDataFromAlertDatabase(database: database);
      print('database opened');
    }).then((value) {
      database = value;
      emit(AppAlertCreateDatabaseState());
    });
  }

  // this for inserting
  Future<void> insertAlertDatabase({
    required String? weight,
    required String? unit,
    required String? karatGold,
    required String? currency,
    required String? price,
    required String isGold,
    required String isSilver,
  }) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO yaffetAlert(isGold,isSilver,weight,unit,karatGold,currency,price) VALUES("$isGold" ,"$isSilver" , "$weight" , "$unit","$karatGold","$currency","$price")')
          .then((value) {
        print('the id is ($value)');
        emit(AppAlertInsertDatabaseState());
        getDataFromAlertDatabase(database: database);
      }).catchError((error) {
        print('error is ${error.toString()}');
      });
    }).catchError(
      (error) {
        print('error is ${error.toString()}');
      },
    );
  }

  //this for getting database
  Future<void> getDataFromAlertDatabase({Database? database}) async {
    // this to not add on old item
    newAlertList = [];
    await database?.rawQuery("SELECT * FROM yaffetAlert").then((value) {
      // this for when get data add in newAlertList
      value.forEach((element) => newAlertList.add(element));
      print("database content \n new yaffetAlert list: \n [ ${newAlertList} ]");
      emit(AppAlertGetDatabaseState());
    }).catchError(
      (error) {
        print('error is ${error.toString()}');
      },
    );
  }

  // this for updating
  // the parameter in this method
  Future<void> updateAlertDatabase({
    required int id,
    int? weight,
    String? unit,
    String? karatGold,
    String? currency,
    int? price,
  }) async {
    await database.rawUpdate(
        'UPDATE yaffetAlert SET weight = ? SET unit = ?   SET karatGold = ? SET currency = ? SET price ? WHERE id = ?',
        [
          weight,
          unit,
          karatGold,
          currency,
          price,
          id,
        ]).then(
      (value) {
        getDataFromAlertDatabase(database: database);
        emit(AppAlertUpdateDatabaseState());
      },
    ).catchError(
      (error) {
        print('error is ${error.toString()}');
      },
    );
  }

// and this for deleting
  // Future<void> deleteData({
  //   required int id,
  // }) async {
  //   await database.rawDelete('DELETE FROM yaffetAlert WHERE id = ?', [
  //     id,
  //   ]).then(
  //     (value) {
  //       getDataFromAlertDatabase(database: database);
  //       emit(AppAlertDeleteDatabaseState());
  //       print('the deleted item : \n $newAlertList');
  //     },
  //   ).catchError(
  //     (error) {
  //       print('error is ${error.toString()}');
  //     },
  //   );
  // }

  // and this for deleting
  Future<void> deleteData({
    required int id,
  }) async {
    await database.rawDelete('DELETE FROM yaffetAlert WHERE id = ?', [
      id,
    ]).then(
      (value) {
        getDataFromAlertDatabase(database: database);
        emit(AppAlertDeleteDatabaseState());
        print('the deleted item : \n $newAlertList');
      },
    ).catchError(
      (error) {
        print('error is \n ${error.toString()}');
      },
    );
  }

  Future<void> updateItemAlert({
    required int? id,
    required String? weight,
    required String? unit,
    required String? karatGold,
    required String? currency,
    required String? price,
    required String isGold,
    required String isSilver,
  }) async {
    await database.transaction((txn) async {
      await txn.update(
        'yaffetAlert',
        {
          'id': id,
          'weight': '$weight',
          'unit': '$unit',
          'karatGold': '$karatGold',
          'currency': '$currency',
          'price': '$price',
          'isGold': '$isGold',
          'isSilver': '$isSilver',
        },
        where: 'id = ?',
        whereArgs: [id],
      );
      getDataFromAlertDatabase(database: database);
      emit(AppAlertUpdateDatabaseState());
    });
  }
}
