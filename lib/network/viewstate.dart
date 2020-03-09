class ViewState<T> {
  Status status;

  T data;

  String message;

  Type type;

  ViewState.completed(this.data) : status = Status.COMPLETED;

  ViewState.loading() : status = Status.LOADING;

  ViewState.error(this.message, this.type) : status = Status.ERROR;

  ViewState();

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status {  COMPLETED, LOADING, ERROR }

enum Type { CONNECTION, OTHER }