import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'file_state.dart';

class FileCubit extends Cubit<FileState> {
  FileCubit() : super(FileInitial());
}
