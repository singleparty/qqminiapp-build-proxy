# ~~`QQ` 小程序 `CI` 镜像添加代理功能~~ 
写完才发现小程序镜像支持代理，只需要配置 `proxy` 就行了
```bash
# 仅供参考
-e HTTP_PROXY=http://host.docker.internal:8080 
-e HTTPS_PROXY=http://host.docker.internal:8080 
# 如果是 Mac 或者 Windows，加这句
--add-host=host.docker.internal:host-gateway 
# Linux，加这句
--add-host=host.docker.internal:127.0.0.1 --net=host
```
写都写了就不删了，留作纪念

## Image
[ciiri/qqminiapp-build-proxy:latest](https://hub.docker.com/r/ciiri/qqminiapp-build-proxy)

## Dockerfile
[singleparty/qqminiapp-build-proxy](https://github.com/singleparty/qqminiapp-build-proxy)

## 需求

由于开发环境网络策略，服务器不能直连互联网，需要经过一层代理做流量转发。

## 方案

而由于 `QQ` 小程序构建工具使用 `Node` 编写，而 `Node` 发送请求不支持全局代理，因此对原镜像二次封装，实现 `Node` 全局代理的功能

## 新增参数
原来参数保持不变，参考 [小程序CI构建](https://q.qq.com/wiki/tools/ci/)，新增下列参数
  - `NODE_GLOBAL_PROXY`

    容器内 `Node` 请求所设置的代理地址，而容器访问宿主机网络的方法很多，这里列举其一
    ```bash
    docker run --rm ... -e NODE_GLOBAL_PROXY=http://host.docker.internal:8080 --add-host=host.docker.internal:host-gateway --privileged=true ciiri/qqminiapp-build-proxy:latest
    ```

### 
