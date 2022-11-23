import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class FileNameCubit extends Cubit<String> {
  FileNameCubit() : super("Pilih file...");

  void setFileName({required String fileName}) async {
    emit(fileName);
  }
}
