package cc.zsakvo.clash.fudge

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    private val CHANNEL = "cc.zsakvo/socks_to_vpn"
    private val REQUEST_CODE = 0

    private lateinit var cService: BaseService
    private var cBound: Boolean = false

    private val connection = object : ServiceConnection {
        override fun onServiceConnected(className: ComponentName, service: IBinder) {
            val binder = service as BaseService.BaseBinder
            cService = binder.getService()
            cBound = true
        }

        override fun onServiceDisconnected(arg0: ComponentName) {
            cBound = false
        }
    }
}
