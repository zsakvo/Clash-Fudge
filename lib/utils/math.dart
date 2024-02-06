class MathUtil {
  static String getFlow(int flow, {accuracy = 2}) {
    if (flow < 1024) {
      return "$flow B";
    } else if (flow < 1024 * 1024) {
      return "${(flow / 1024).toStringAsFixed(accuracy)} KB";
    } else if (flow < 1024 * 1024 * 1024) {
      return "${(flow / 1024 / 1024).toStringAsFixed(accuracy)} MB";
    } else if (flow < 1024 * 1024 * 1024 * 1024) {
      return "${(flow / 1024 / 1024 / 1024).toStringAsFixed(accuracy)} GB";
    } else {
      return "${(flow / 1024 / 1024 / 1024 / 1024).toStringAsFixed(accuracy)} TB";
    }
  }

  static (String, String) getFlowTuple(int flow) {
    if (flow < 1024) {
      return (flow.toString(), "B");
    } else if (flow < 1024 * 1024) {
      return ((flow / 1024).toStringAsFixed(2), "KB");
    } else if (flow < 1024 * 1024 * 1024) {
      return ((flow / 1024 / 1024).toStringAsFixed(2), "MB");
    } else if (flow < 1024 * 1024 * 1024 * 1024) {
      return ((flow / 1024 / 1024 / 1024).toStringAsFixed(2), "GB");
    } else {
      return ((flow / 1024 / 1024 / 1024 / 1024).toStringAsFixed(2), "TB");
    }
  }
}
