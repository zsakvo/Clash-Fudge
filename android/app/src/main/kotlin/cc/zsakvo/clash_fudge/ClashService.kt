package cc.zsakvo.clash_fudge

import android.app.Service
import android.net.ProxyInfo
import android.os.ParcelFileDescriptor
import android.util.Log
import cc.zsakvo.mobile.Mobile

class ClashService : BaseService() {
    private var tun: ParcelFileDescriptor? = null
    private var mtu = 1500
    private var isRunning = false

    private fun setupTun() {
        tun = Builder()
            .setSession("Clash-Fudge")
            .setMtu(mtu)
            .setBlocking(false)
            .setMetered(false)
            .addDnsServer("8.8.8.8")
            .addDnsServer("223.5.5.5")
            .addRoute("0.0.0.0", 0)
            .addAddress("198.18.0.1", 30)
            .addDisallowedApplication(packageName)
            .establish() ?: throw Exception("启动隧道失败")
    }

    override fun setupVpnServe() {
        setupTun()
        Mobile.operateTun(true, tun?.detachFd()!!, mtu)
        Log.i("ClashService", "开启VPN服务")
//        startForeground()
    }

    override fun closeVpnService() {
        Mobile.operateTun(false, 0, 0)
        tun?.close()
        stopForeground(Service.STOP_FOREGROUND_REMOVE)
        Log.i("ClashService", "停止VPN服务")
        super.closeVpnService()
    }

    override fun setupClashServe(): Boolean {
        if (!isRunning) {
            isRunning = Mobile.startService()
            Log.i("ClashService", "开启Clash服务状态: $isRunning")
        }
        return isRunning
    }
}
