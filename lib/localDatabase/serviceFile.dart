import 'familyModel.dart';
import 'repo.dart';

class LoginService {
  late Repo _repo;
  LoginService() {
    _repo = Repo();
  }

  saveLogin(Login login) async {
    //  print(todo);
    return await _repo.insertData('login', login.toJson());
  }

  checkValidUser(email, password) async {
    return await _repo.readUser(email, password);
  }

  readAllMember() async {
    return await _repo.readData('login');
  }

  deleteTodo(memberId) async {
    return await _repo.deleteData('login', memberId);
  }

  updateTodo(Login login) async {
    return await _repo.updateData('login', login.toJson());
  }
}
