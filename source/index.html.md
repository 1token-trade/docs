---
title: 1Token使用指南

language_tabs: # must be one of https://git.io/vQNgJ
  - json
  - python

# toc_footers:
#   - <a href='#'>Sign Up for a Developer Key</a>
#   - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  # - errors

search: true
---

# 1Token使用指南

## 1Token可以做什么？

现在市面上有很多数字货币的交易所，一些交易者想要在多个交易所进行交易，因此需要自行管理多家交易所的账号，编写不同的程序去对接不同交易所的API————这对任何个人和机构来说都不算一件轻松愉快的事。

1Token将不同交易所的API进行整理和封装，提供给用户一套统一的API。用户使用1Token提供的统一API，以及对应的[交易所标识](#支持的交易所)就可在对应交易所进行交易。

举例来说，Abo是一个数字货币的交易者，他想在huobi.pro和gate.io这两个交易所做跨交易所套利。

* **不使用1Token**: Abo需要编写两个程序来分别实现与huobi.pro和gate.io两个交易所API的对接，或是在huobi.pro和gate.io的网站之间切换以进行交易。

* **使用1Token**：Abo在1Token完成相应账户设置之后，只需使用1Token提供的SDK(或自己实现1Token API的对接），或是直接在1Token网站内即可完成huobi.pro和gate.io两个交易所的交易。

Abo使用1Token之后，交易前的准备由对接huobi.pro和gate.io两个系统，变为只需对接1Token一个系统（使用1Token SDK可以大大加速这一步），工作量由2变为1甚至更少。如果Abo想要在n个交易所进行交易，1Token可以将交易前的准备工作量由n变为1。

**交易者涉及的交易所越多，1Token的优势越明显。**

1Token将交易者从繁杂的多交易所账号管理和API对接之中解放出来，帮助交易者将更多的精力集中于交易本身。

## 联系我们

若您对文档存在疑问，需要帮助请<a id='contact-us'>联系我们</a>（1Token微信客服：onetoken001）。

![客服001](https://cdn.1tokentrade.cn/otimg-sh/web/common/qb-code.jpg)

## 初次使用

请先阅读使用[模拟账号交易](#mock-account)。该小节对以下几点进行了说明：

1. 如何申请1Token模拟账号；

2. 如何给模拟账号添加资产；

3. 1Token交易界面主要元素介绍。

## API用户入门

通过API，用户可以拿到基本的信息，比如交易所列表，交易所的合约的信息等。其中，通过Websocket API（[websocket API教程](#quote-websocket)）来订阅逐笔和tick；通过Rest API（[Rest API教程](#rest-api)）来进行下单等交易操作。

如果用户想要通过API连接1Token并完成相关操作, 请参考[API用户入门指南](#api-user)。该小节讲述了以下内容：

1. 如何在1Token生成用于api操作的`ot-key`和`ot-secret`

2. Python示例代码

## API用户进阶

对于想自己直接对接API的用户，1Token提供有关API的详细swagger说明，用户可以按需查阅：

* [Swagger Basic API](https://1token.trade/r/swagger?url=/r/swagger/quote.yml)
* [Swagger Quote API](https://1token.trade/r/swagger?url=/r/swagger/quote.yml)
* [Swagger Trade API](https://1token.trade/r/swagger?url=/r/swagger/trade.yml)

在直接查阅详细API之前，推荐先阅读[API Reference](#rest-api)这一小节，大致了解基本信息、行情API、交易加密方式、交易API、历史数据API，之后的API对接会更加容易上手。

## onetoken SDK

**注意**: 1Token提供的API是**语言无关**的，可以通过任何支持网络访问的编程语言来使用API。SDK在API上做了一层包装，使得用户可以更加轻松快速地入手，将注意力更多地放在交易本身，而不用过多关注API的细节， 我们用不同语言实现了强壮完善的SDK(目前支持[Python 3.6+](https://github.com/1token-trade/onetoken/blob/master/readme.md)(推荐) ，[golang](https://github.com/1token-trade/onetoken-go-sdk)，[c++](https://github.com/1token-trade/1token-ctp))，更多语言正在开发中。

1.onetoken SDK的安装(Python 3.6+)；

`pip3 install onetoken -U`

2.通过运行样例来初步了解SDK中quote和account相关功能, 请参考[SDK样例](#sdk)。

## 历史数据(tick)

1Token提供历史行情的下载，具体教程请查看[历史数据](https://1token-trade.github.io/docs/hist-quote)一节。

# 模拟账号申请与交易

<b><a id="mock-account">通过1Token网页来添加模拟账户进行模拟交易</a></b>

* 1Token模拟账户拥有与实盘账户完全相同的功能，可以在各交易所自由模拟交易;

* 模拟账户介绍页面：<https://1token.trade/help/account/360047348011>。

**第一步 登录账号后，添加新的模拟账户**

![step1](https://1token.trade/docs/img/201.png)

**第二步 设置模拟账户交易所和账户名**

* 每个交易所可以设置多个模拟账户。

![step2](https://1token.trade/docs/img/202.png)

**第三步 模拟账户添加完成**

* 每个添加的模拟账户都有初始资产，用户也可以通过选项来添加模拟资产。

![step3](https://1token.trade/docs/img/203.png)

**第四步 添加模拟资产**

* 模拟账户可以任意添加模拟资产。

![step4](https://1token.trade/docs/img/204.png)

**第五步 进入币币交易界面进行交易**

* 模拟交易请选择mock开头的模拟账户。

![step5](https://1token.trade/docs/img/008.png)

# API交易入门指南

<b><a id='通过API来进行交易'>通过API来进行交易</a></b>

1Token API可以操作所有的账号 包括绑定账号、统一账号和模拟账号。在下面这个入门教程中，我们会使用模拟账号来当例子，其他账号也可以通过API来获取账户信息和下单。

**1. 在使用API交易前先注册1Token以及创建模拟交易账户并添加资产**

* 添加模拟账户请参考在1Token[添加模拟账户](#mock-account)。

**2. 创建OT Key和OT Secret，请务必保管好新建的OT Key和OT Secret**

* 创建OT Key的页面：<https://1token.trade/account/apis>

![step1](https://1token.trade/docs/img/101.png)

<b><a id='api-user'>3. Python示例代码</a></b>

* API是语言无关的，用户可以通过偏好的语言使用，我们目前提供python 3.6+的demo供用户参考, 后续将会提供更多语言的demo。

`git clone https://github.com/1token-trade/onetoken`

* public接口demo

* 进入demo-python-sync目录，命令行中运行命令`python demo_public.py`

![step2](https://1token.trade/docs/img/demo_public_0.png)

* 看到类似以下输出说明连接成功

![step3](https://1token.trade/docs/img/demo_public_1.png)

* private接口demo

* 进入demo-python-sync目录，命令行中运行命令`python demo_private.py`

![step4](https://1token.trade/docs/img/demo_private_0.png)

* 成功运行后会看到以下输出：

![step5](https://1token.trade/docs/img/demo_private_1.png)

* 依次输入之前的操作中添加的 OT Key，OT Secret以及账号，账号格式为”平台英文标识符/账号”，不清楚账号格式的请参考[账号格式介绍](#account-symbol)。

* 输入正确的参数后会看到以下输出：

![step6](https://1token.trade/docs/img/demo_private_2.png)

## 使用API交易绑定账号

<a id='website-user'><b>通过1Token网页来进行交易：</b></a>

**第一步 点击注册**

![step1](https://1token.trade/docs/img/001.png)

**第二步 填写信息 完成注册**

![step2](https://1token.trade/docs/img/002.png)

**第三步 登录交易所，点击API管理，创建API （以火币为例）**

![step3](https://1token.trade/docs/img/003.png)

![step3](https://1token.trade/docs/img/004.png)

**第四步 设置API备注，创建API, 保存访问密钥和私密密钥**

![step4](https://1token.trade/docs/img/005.png)

**第五步 进入1Token用户中心，添加绑定账户**

![step5](https://1token.trade/docs/img/006_1.png)

**第六步 输入绑定交易所的密钥与私钥，添加API**

![step6](https://1token.trade/docs/img/006_2.png)

## 使用API交易统一账号

**通过1Token网页来添加统一账户进行交易**

统一账户介绍页面：<https://1token.trade/help/account/360019846492>

**第一步 登录账号后，开通统一账户**

![step1](https://1token.trade/docs/img/301.png)

**第二步 选择账户充币**

![step2](https://1token.trade/docs/img/302.png)

**第三步 等待充值到账**

## 账号格式介绍

<b><a id='account-symbol'>账号格式</a></b>

* 在私有API接口中通常需要用到account参数，该参数格式为”平台英文 标识符/账号”。

* 例：火币的平台标识符为huobip, 账号名为mock-demo，则account参数应为：huobip/mock-demo。

* 常用平台英文标识符如下:

交易平台 |	平台标识符
--------- | ------- 
火币 |	huobip
OKEX(现货) |	okex
OKEX(合约) |	okef
币安 |	binance
币安(合约) |	binancef

* 更多交易所标识符及信息介绍请参考[交易所的详细介绍](#exchange-details)

* 查询自己的账户名称请参考下图：

![](https://1token.trade/docs/img/sdk_account_demo.png)

# API交易详细文档

<b><a id="rest-api">RESTful API</a></b>

* 1Token所有的API(包括websocket和REST) 都是以`https://1token.trade/api/v1/`开头的请参考[网络相关](#网络相关)；
* 为了让用户更方便地调用API，1Token提供了Python SDK，用户可以通过`pip install onetoken -U`命令安装。

对于想对接1Token API进行实盘交易的用户，以下是1Token API的详细swagger文档：

* [Quote Websocket](#quote-websocket)
* [Swagger Basic API](https://1token.trade/r/swagger?url=/r/swagger/quote.yml)
* [Swagger Quote API](https://1token.trade/r/swagger?url=/r/swagger/quote.yml)
* [Swagger Trade API](https://1token.trade/r/swagger?url=/r/swagger/trade.yml)

## 基本信息

* 基本信息的api可以拿到所有的交易所列表；

* 以及一个交易所的所有的支持交易对（contract）的列表；

* 和一些其他的基本公开信息。

详细api请参考[基本信息API](https://1token.trade/r/swagger?url=/r/swagger/quote.yml)。

## 行情API

行情API支持rest的方式去获取最新的行情信息：

* 各个交易所历史的candle；
* 各个交易所中各个交易对历史逐笔；
* 单个交易所当前的tick；
* 单个交易所单个合约当前的tick。

API的详细介绍请参考[行情 Swagger API](https://1token.trade/r/swagger?url=/r/swagger/quote.yml)。

## 交易API

通过交易API，您可以：

* 获取到交易所某个账号的余额；
* 获取到交易所某个账号的持仓信息；
* 对某个交易所的某个合约进行下单；
* 对已经下去的某个订单进行撤单；
* 获取某个账号的充值地址；
* 对某个账号进行提现。

详情请参考[交易 Swagger API](https://1token.trade/r/swagger?url=/r/swagger/trade.yml)。

## 历史数据API

你可以通过API去下载所有的历史tick行情[Hist Quote](https://1token-trade.github.io/docs/hist-quote)。

# REST基础信息（公共接口）

公共接口可用于获取配置信息和行情数据。公共请求无需认证即可调用。

**常用公共接口**

* [获取交易所列表](https://1token.trade/swagger?url=/swagger/basic.yml#/Exchanges/get_exchanges)

  * 返回1Token支持的所有交易所（exchange）

  * <https://1token.trade/api/v1/basic/exchanges>

* [获取交易所交易币对列表](https://1token.trade/swagger?url=/swagger/basic.yml#/Contracts/get_contracts)

  * 返回某个交易所（exchange）支持的交易对（contract）列表

  * 例如查询火币交易所(huobip)：<https://1token.trade/api/v1/basic/contracts?exchange=huobip>

  * 查询OKEX交易所合约交易(okef)：<https://1token.trade/api/v1/basic/contracts?exchange=okef>

  * 交易对的信息包括：

参数 |	描述 |  示例
--------- | -------  | ------- 
min_change | 价格跳动的最小单位 | 比如 eos.usdt min_change = 0.01 代表挂单买入eos.usdt的价格可以是 4.01/4.02/...
min_amount | 下单数量的最小值 | 比如 eos.usdt min_amount = 1 代表最少需要买入/卖出 1个eos
unit_amount | 下单数量的最小变动单位 | 比如 eos.usdt unit_amount = 0.1 代表可以买入/卖出 1.0/1.1/1.2/... 个 eos
min_notional | 下单的最小资产 （ price * amount ) | 比如 eos.usdt 的min_notional = 10 代表至少挂单的price* amount 需要>=10 这个字段不是所有交易所都会有
symbol | 交易对的唯一标示 ${exchange}/${currency}.${underlying} 

* [获取交易所最新tick](https://1token.trade/swagger?url=/swagger/quote.yml#/Tick/get_ticks)

  * REST接口返回的tick数据只有一档，需要多档数据请使用WebSocket接口；

  * 返回某个交易所（exchange）所有支持交易对的最新tick，例如查询火币交易所(huobip)：<https://1token.trade/api/v1/quote/ticks?exchange=huobip>；

  * 返回某个交易所（exchange）单个支持交易对（contract）的最新tick，例如查询OKEX交易所（okex）btc.usdt交易对：<https://1token.trade/api/v1/quote/single-tick/okex/btc.usdt>。

* [获取服务器时间](https://1token.trade/swagger?url=/swagger/basic.yml#/Server_Time/get_time)

  * 返回当前服务器时间：<https://1token.trade/api/v1/basic/time>；

  * 获取服务器时间通常是为了统计延时或者进行测试，关于延时的更多信息请参考请参考[网络相关](#网络相关)。

* [获取服务器地址池](https://1token.trade/swagger?url=/swagger/basic.yml#/IP/get_ip_pool)

  * <https://1token.trade/api/v1/basic/ip-pool>

**更多**

* 详细api的参数列表 返回错误的指示请参考[基本信息Swagger文档](https://1token.trade/swagger?url=/swagger/basic.yml)；

* 若您对文档存在疑问，需要帮助请[联系我们](#contact-us)。

# Websocket行情（公共接口）

## Websocket API

<b><a id="quote-websocket">订阅方式</a></b>

* 可以订阅实时行情，推送包括实时candle，24小时涨跌幅数据，tick以及逐笔数据，以Json格式发送并接受请求。

> 订阅实时行情格式

```json
{
    "uri":"",
    "command":""
}
```

* 所有接口支持心跳方式检测服务器是否在线，心跳时长为30秒。若客户端超过30秒未发送心跳包，服务端会返回丢失心跳的通知，并主动断开该连接。

> 获取心跳示例

```json
//Websocket Client request
{
    "uri": "ping"
}
//Websocket Server response
{
    "uri": "pong",
    "timestamp": 1526357597.237
}
```

* 同时支持UUID字段以标示不同连接(服务端返回相同UUID)。

> 支持UUID字段以标示不同连接示例

```json
//Websocket Client request
{
    "uri": "ping",
    "uuid": "this-is-a-uuid"
}
//Websocket Server response
{
    "uri": "pong",
    "uuid": "this-is-a-uuid",
    "timestamp": 1526357597.237
}
```

* 所有Websocket接口支持服务端发送gZip格式数据，是否使用gZip以各Websocket的地址参数为准。如`wss://1token.trade/api/v1/ws/tick?gzip=true`则表明使用gZip压缩传输数据。

<aside class="notice">除tick-v3行情Websocket接口，在用户没用指明是否使用gZip的情况下，其它接口均默认不使用gZip压缩数据传输。</aside>

## 实时tick、逐笔交易数据接口

* 推送各交易所的tick、逐笔交易数据，每个web socket连接最多允许订阅 50个不同contract 的实时数据。

* 地址：`wss://1token.trade/api/v1/ws/tick`

* 订阅之前首先需要发送auth进行认证。

> auth认证示例

```json
// Websocket Client request
{
    "uri":"auth"
}
// Websocket Server response
{
    "uri":"auth",
    "message":"Auth succeed."
}
```

* 订阅tick数据, 如果需要请求多个tick， 可以在同一个websocket里面发送多个subscribe-single-tick-verbose的请求, 每个请求带着不同的contract。

> 订阅tick示例

```json
//Websocket 发送订阅请求
{
    "uri": "subscribe-single-tick-verbose",
    "contract": "bitfinex/btc.usd"
}
//Websocket 返回订阅成功一次
{
    "uri": "subscribe-single-tick-verbose",
    "code": "success",
    "contract": "bitfinex/btc.usd"
}
//每当Tick更新时 返回
{
    "uri":"single-tick-verbose",
    "data":
    {
         "asks":
         [
             {"price": 9218.5, "volume": 1.7371},
             ...
         ],
         "bids":
         [
             {"price": 9218.4, "volume": 0.81871728},
             ...
         ],
         "contract": "bitfinex/btc.usd",
         "last": 9219.3,  // 最新成交价
         "time": "2018-05-03T16:16:41.630400+08:00",  // 1Token的系统时间 ISO 格式 带时区
         "exchange_time": "2018-05-03T16:16:41.450400+08:00",  // 交易所给的时间 ISO 格式 带时区
   }
}
```

* 订阅逐笔数据, 如果需要请求多个contract的逐笔数据， 可以在同一个websocket里面发送多个subscribe-single-zhubi-verbose的请求, 每个请求带着不同的contract。

> 订阅逐笔示例

```json
//Websocket Client request
{
    "uri": "subscribe-single-zhubi-verbose",
    "contract": "bitfinex/btc.usd"
}
//Websocket Server response (订阅成功后返回一次)
{
    "code": "success",
    "uri": "subscribe-single-zhubi-verbose",
    "contract": "bitfinex/btc.usd"
}
//Websocket Server response (持续)
{
    "uri":"single-zhubi-verbose",
    "data":
    [
        {
            "amount": 0.21,
            "bs": "s",
            "contract": "bitfinex/btc.usd",
            "exchange_time": "2018-05-03T08:14:20.307000+00:00",
            "price": 9231.8,
            "time": "2018-05-03T16:14:20.541068+08:00"
        }
    ]
}
```

* 逐笔与tick数据支持订阅后退订。

> 退订示例

```json
//Websocket Client request
{
    "uri": "unsubscribe-single-tick-verbose",
    "contract": "bitfinex/btc.usd"
}
//或
{
    "code": "success",
    "uri": "unsubscribe-single-zhubi-verbose",
    "contract": "bitfinex/btc.usd"
}
```

## 实时candle数据接口

> 订阅candle示例

```json
//Websocket Client request
{
    "contract":"huobip/btc.usdt",
    "duration": "1m",
    "uri": "subscribe-single-candle"
}
//Websocket Server response
{
    "code": "success",
    "contract":"huobip/btc.usdt",
    "duration": "1m",
    "uri": "subscribe-single-candle"
}
//Websocket Server response
{
    "uri": "single-candle",
    "amount": 16592.4, //成交量
    "close": 9220.11,
    "high": 9221,
    "low": 9220.07,
    "open": 9220.07,
    "volume": 0.3, //成交额
    "contract": "huobip/btc.usdt",
    "duration": "1m",
    "time": "2018-05-03T07:30:00Z" // 时间戳 isoformat
}
```

* 推送各个交易所的实时candle数据，每个websocket连接最多允许订阅50个**不同时长**合约的实时数据。

* 地址: <wss://1token.trade/api/v1/ws/candle>。

* 支持不同时长：1m,5m,15m,30m,1h,2h,4h,6h,1d,1w。

* 支持同一连接订阅多个合约。

## 24小时涨跌幅数据接口

* 推送各个合约的当前价格以及24小时涨跌幅。

> 订阅24小时涨跌幅数据示例

```json
//Websocket Client request
{
    "uri":"batch-subscribe",
    "contracts":["huobip/btc.usdt", "huobip/ht.usdt"]
}
//Websocket Server response
{
    "uri":"batch-subscribe",
    "code":"success"
}
//Websocket Server response
{
    "uri":"low-freq-quote",
    "data":
    [
        {
            "contract":"huobip/btc.usdt", 
            "rise":3.345103,
            "price":6152.32,
            "price_s":"6152.32"         //根据交易所的min_change format的字符串
        },
        {
            "contract":"huobip/ht.usdt", 
            "rise":-0.539916,
            "price":3.7027,
            "price_s":"3.7027"
        }
    ]
}
```

* 地址: <wss://1token.trade/api/v1/ws/low-freq-quote-v2>。

* 支持同时订阅不同交易所的不同合约。

* 其中，rise的单位为百分比，同时推送float64以及string类型的当前价格（price）。

* 支持订阅后退订。

> 退订24小时涨跌幅数据示例

```json
//Websocket Client request
{
    "uri":"batch-unsubscribe",
    "contracts":["huobip/btc.usdt", "huobip/ht.usdt"]
}
//Websocket Server response
{
    "uri":"batch-unsubscribe",
    "code": "success"
}
```

## 实时增量tick行情 （tick-v3）

> 订阅实时增量tick示例

```json
//Websocket Client request
{
    "uri":"auth"
}
//Websocket Server response
{
    "uri":"auth",
    "message":"Auth succeed."
}
//Websocket Client request
{
    "uri":"subscribe-single-tick-verbose","contract":"huobip/btc.usdt"
}
//Websocket Server response(snapshot)
 {
     "tp":"s",                      //type: snapshot
     "ui":16222,                    //update_id: 16222
     "tm":1527401596.654875,        //time
     "et":1527401596.511            //exchange_time
     "c":"huobip/btc.usdt",         //contract
     "l":7291.79,                   //last
     "b":                           //bids
     [
        [7291.97,1],                //[price, volume]
        ...
        [7232.65,0.1155]
     ],
     "a":                           //asks
     [
        [7292.51,0.001],
        ...
        [7455.15,0.1]
     ]
}
//Websocket Server response(diff)
{
    "tp":"d",                       //type: diff
    "ui":16223,
    "tm":1527401598.138354,
    "et":1527401598.013,
    "c":"huobip/btc.usdt",
    "l":7291.97,
    "b":
    [
        [7291.97,0.8298],
        ...,
        [7232.65,0]
    ],
    "a":
    [
        [7297.19,0.2],
        ...,
        [7455.15,0]
    ]
}
```

* 推送v3格式的tick行情，每隔30秒服务器会推送snapshot的全量行情，在此间隔内发送行情diff数据，客户端可以通过计算snapshot+diff得出当前行情。每个websocket连接最多允许订阅50个**不同contract**的实时数据。

* 在diff类型的数据中，如bids或者asks中存在[x,y=0]的情况，则删除上个snapshot中bids或asks价格为x的行情，否则更新此价格行情的挂单数量为y。

* 地址:<wss://1token.trade/api/v1/ws/tick-v3>。

* 该接口默认采用gZip压缩数据发送至客户端，客户端首先需要发送auth进行认证。

* 接口支持同时订阅不同交易所的不同合约。

## 限速以及其他限制

* websocket目前单个IP连接限制是30个, 单个IP带宽限制是100KB每秒(800kbps). 其他的限制比如每秒最大连接次数目前1Token没有特别的限制, 请在合理范围内使用. 如果超过带宽限制之后 服务端会向客户端发送 `{"uri":"status", "code": "rate-limit-exceed"}` 并断开链接。

* 如果您需要商务上的合作,比如获取全量的实时行情, 或者一些定制化专线行情的需求, 请联系1Token客服,备注 **企业版行情**。

![客服001](https://cdn.1tokentrade.cn/otimg-sh/web/common/qb-code.jpg)  

![客服002](https://1token.trade/docs/img/qrcode002.png)



# 私有接口

## REST私有接口

私有接口可用于订单管理和账户管理。每个私有请求必须使用规范的验证形式进行签名。

**签名**

以下代码为签名原理介绍，我们的样例代码中提供了完整的签名方法，您无需自己完成签名代码，**请参考：**[Python示例代码](#api-user)。

**OT-API/KEY 加密方式**

用API来交易时需要在请求的`HTTP header`中加入以下内容以完成**身份验证**：

key |	value
--- | ---
`Api-Nonce` |	一个在0到2^53大小范围内增加的值
`Api-Key` |	在1token生成的`OT-KEY`（若没有，请参考[生成OT_KEY](#通过API来进行交易)）
`Api-Signature` |	本次请求的签名，计算方法为`hex(HMAC_SHA256(ot_secret, verb + path + nonce + data))`

**Api-Signature 签名例子**

* `data` 应与本次请求发送到服务器的`raw body`相同, 在POST请求中是一个json字符串, 比如 `{"contract": "huobip/btc.usdt", "price": 1, "bs": "b", "amount": 0.6}`, 在 GET请求中是一个空字符串；

* `verb` GET/POST/DELETE 需要大写；

* `path` 比如完整的请求路径是 <https://1token.trade/api/v1/trade/okex/demo-account/orders?state=end> 那么签名的path是 `/okex/demo-account/orders`。

> Python代码示例

```python
import time
import json
import urllib.parse
import hmac
import hashlib
import requests

# 填入你的ot_key
ot_key = ''
# 填入你的ot_secret
ot_secret = ''

def gen_nonce():
    return str((int(time.time() * 1000000)))


def gen_headers(nonce, key, sig):
    headers = {
        'Api-Nonce': nonce,
        'Api-Key': key,
        'Api-Signature': sig,
        'Content-Type': 'application/json'
    }
    return headers


def gen_sign(secret, verb, path, nonce, data=None):
    if data is None:
        data_str = ''
    else:
        assert isinstance(data, dict)
        # server并不要求data_str按key排序，只需此处用来签名的data_str和所发送请求中的data相同即可，是否排序请按实际情况选择
        data_str = json.dumps(data, sort_keys=True)
    parsed_url = urllib.parse.urlparse(path)
    parsed_path = parsed_url.path

    message = verb + parsed_path + str(nonce) + data_str
    signature = hmac.new(bytes(secret, 'utf8'), bytes(message, 'utf8'), digestmod=hashlib.sha256).hexdigest()
    print('nonce:', nonce)
    print('parsed_path:', parsed_path)
    print('data_str:', data_str)
    print('message:', message)
    return signature


def place_order():
    verb = 'POST'

    # 下单的api前缀如下，具体请查看1token API文档
    url = 'https://1token.trade/api/v1/trade'

    # path的具体构成方法请查看1token API文档
    path = '/huobip/zannb/orders'

    nonce = gen_nonce()
    data = {"contract": "huobip/btc.usdt", "price": 1, "bs": "b", "amount": 0.6}
    sig = gen_sign(ot_secret, verb, path, nonce, data)
    headers = gen_headers(nonce, ot_key, sig)
    # server并不要求请求中的data按key排序，只需所发送请求中的data与用来签名的data_str和相同即可，是否排序请按实际情况选择
    resp = requests.post(url + path, headers=headers, data=json.dumps(data, sort_keys=True))
    print(resp.json())


def get_info():
    verb = 'GET'
    url = 'https://1token.trade/api/v1/trade'
    path = '/huobip/zannb/info'
    nonce = gen_nonce()
    sig = gen_sign(ot_secret, verb, path, nonce)
    headers = gen_headers(nonce, ot_key, sig)
    resp = requests.get(url + path, headers=headers)
    print(resp.json())


def main():
    place_order()
    get_info()


if __name__ == '__main__':
    main()
```

**常用私有接口**

* [获取账户信息](https://1token.trade/swagger?url=/swagger/trade.yml#/Account/get__exchange___account__info)
* [创建订单](https://1token.trade/swagger?url=/swagger/trade.yml#/Order/post__exchange___account__orders)
* [取消订单](https://1token.trade/swagger?url=/swagger/trade.yml#/Order/delete__exchange___account__orders)
* [获取最近成交记录](https://1token.trade/swagger?url=/swagger/trade.yml#/Order/get__exchange___account__trans)

**遇到了问题？**

* 如果本次请求包含`body`，请确保将`Content-Type`设置为`application/json`。

* 更多详细接口内容请参考[深入了解API](#rest-api)。

* 若您对文档存在疑问，需要帮助请[联系我们](#contact-us)。

## Websocket账户信息订阅

**签名**

* 支持API账户的账户信息和订单状态推送，每一个账户一个websocket连接。

* 地址: `wss://1token.trade/api/v1/ws/trade/{account_symbol}` 例如: `wss://1token.trade/api/v1/ws/trade/okex/1token-demo`

* **签名验证** 打开websocket连接时需要通过HTTP headers做验证:

key |	value
--- | ---
`Api-Nonce` |	一个递增的数字，0到2^53
`Api-Key` |	你的 1Token OT-key
`Api-Signature` |	请求签名，计算方法`hex(HMAC_SHA256(ot_secret, verb + path + nonce + data))`，这里的path为/ws/{account_name}，例如/ws/1token-demo，1token-demo是account symbol中的账户名部分。 需要注意的是, 这里签名的部分由于历史原因是 **/ws/1token-demo 而不是 /ws/okex/1token-demo**


> 打开连接后会收到验证成功或失败的反馈

```json
//header 里面没有包含 api-key api-signature 三秒后断开
{"uri": "wait-for-jwt"}
//签名验证失败
{"uri": "auth", "code": "fail", "message": {ot-error}}
//连接成功
{"uri": "status", "code": "connected", "message": "account: ****"}
```

**订阅账户资产信息更新 sub-info**

* 支持同一连接订阅多个频道。

> 订阅账户信息示例

```json
//request
{"uri":"sub-info"}
//response
{"uri": "sub-info", "code": "success"}
//推送信息格式
{"uri": "info", "type": "snapshot", "data": {acc-info}}
```

* 每当交易所推动账户信息变动时，1token后台会同时向客户端推送一个账户信息的快照，其结构与account info接口数据一致。如果交易所ws推送不稳定客户端会受到status为failed的错误信息。 `{"status": "fail", "uri": "order"}`

* 目前支持账户信息推送的交易所：binance、binancef、bitmex、okex、okef、okswap、huobip、huobif。

**订阅账户订单更新 sub-order**

> 订阅订单变化示例

```json
//request
{"uri":"sub-order"}
//response
{"uri": "sub-order", "code": "success"}
//推送信息格式
{"uri": "order", "type": "snapshot" (or "update"), "data": [order]}
```

* 当用户首次订阅订单信息时，将会收到一份当前挂单列表，之后每当交易所推送订单相关信息时，1token会将发生变化的订单推送到客户端，数据结构与Restful API的get order接口返回一致。

> 发生变化的订单返回示例

```json
[
    {
        "account": "huobip/ot-user1",
        "contract": "huobip/btc.usdt",
        "exchange_oid": "huobip/btc.usdt-123445566",
        "bs": "b",
        "entrust_price": 7045.5,
        "entrust_amount": 1,
        "entrust_time": "2018-08-20T13:55:33.421000+08:00",
        "status": "pending",
        "average_dealt_price": 0,
        "dealt_amount": 0,
        "last_dealt_amount": null,
        "closed_time": null,
        "exchange_update": null,
        "commission": 0,
        "client_oid": "your-client-oid",
        "version": 0,
        "tags": {},
        "options": {},
        "last_update": "2018-08-20T13:56:10.066477+08:00",
        "ots_closed_time": null,
        "canceled_time": null
    }
]
```

* 目前支持订单信息推送的交易所：huobip、huobif、binance、bitmex、okex、okef、bitfinex、coinbase。

# SDK样例

<b><a id='sdk'>1. 安装onetoken SDK</a></b>

我们目前推荐使用提供python 3.6+的SDK, 不过API是语言无关的, 其他语言也可以使用。安装python的SDK，可以使用如下指令：

`pip3 install onetoken -U`


<b>2. 执行 quote 样例</b>

`git clone https://github.com/1token-trade/onetoken`

进入 onetoken 目录，命令行中运行命令 `python demo-python-async/quote.py`

![step2](https://1token.trade/docs/img/102.png)

看到类似以下输出说明 quote 连接成功 

![step3](https://1token.trade/docs/img/103.png)

<b>3. 执行 account 样例</b>

进入 onetoken/demo-python-async 目录，命令行中运行命令 `python demo-python-async/account.py`

![step4](https://1token.trade/docs/img/104.png)

依次输入步骤 1 添加的 OT Key 和 OT Secret以及步骤 2 添加的账号，账号格式为”平台英文 标识符/账号”（请注意模拟账户的账号名是以mock-开头），

常用平台英文标识符如下:

交易平台 | 平台标识符
--- | ---
火币(现货) |	huobip
火币(合约) |	huobif
OKEX(现货) |	okex
OKEX(合约) |	okef
币安 |	binance
币安(合约) |	binancef

更多交易所标识符及信息介绍请参考 [交易所的详细介绍](#exchange-details)。

以下图为例：

![step5](https://1token.trade/docs/img/sdk_account_demo.png)
 
火币的平台标识符为huobip, 账号名为mock-demo，则account参数应为：huobip/mock-demo。

<aside class="notice">account 样例中下单测试的交易对为 'huobip/btc.usdt' 和 'huobip/eth.usdt'，如使用其他交易所或交易对请注意修改。</aside>

看到如下输出说明样例执行成功:

![step6](https://1token.trade/docs/img/105.png)

# VNPY 1Token文档

## 更新SDK

把 `https://raw.githubusercontent.com/1token-trade/vnpy/dev-1token/vnpy/gateway/onetoken/onetoken_gateway.py` 复制到 `c:\vnstudio\lib\site-packages\vnpy\gateway\onetoken` 下面

## 行情

我们提供了一个供测试的

* 输入测试 OT Key: vglTLYcq-Unx1gO3S-VCHQaMs5-HvVRQkcX

* 输入测试 OT Secret: NNXveWWx-TqbNNtMZ-xB6sska0-CVDQBP40

* 交易所选择 OKEX

* 账号填写 mock-vnpyplay

* 代理地址留空

* 代理端口填0

在左上角选择交易所, 填入交易对, 按回车键, 一切正常的话, 行情会添加在右侧图表里面

* 由于1Token和VNPY的架构有所不同 所以选择有一定的区别

  * 比如okef的期货交易所 在左上角只需要选择OKEX, 下面代码填写 eth.usd.q 即可

  * 比如okex的现货交易所 在左上角只需要选择OKEX, 下面代码填写 eth.usdt 即可

https://1token.trade/docs#/instruction/naming-rules?id=币币交易代码

![vnpy quote](https://raw.githubusercontent.com/1token-trade/vnpy/dev-1token/vnpy/gateway/onetoken/quote.png)

## 交易

* 模拟账号 填入 代码, 价格, 数量之后 可以正常下单

![vnpy trade](https://raw.githubusercontent.com/1token-trade/vnpy/dev-1token/vnpy/gateway/onetoken/trade.png)

# 细节和底层

## 名词解释

<b><a id='word-explanation'>名词解释</a></b>

为了让之后文档的描述更加准确和清晰，对下列名词进行解释。具体数据结构请查看[数据结构](#data-structure)一节。

**Zhubi**

* 针对一条成交记录；

* 逐笔(zhubi)成交记录，主要包含了该次交易的合约、成交时间、价格、成交量、方向（买或是卖）；

**Tick**

* Tick是针对一个标的某个时间点的快照；

* 一个Tick会包含这个时间点的订单簿(orderbook)的买卖单（bids,asks)；

* 最新成交价（last）: 根据该合约最近时刻的逐笔得出。

## 变量命名规则

<a id='naming-rules'><b>命名规则</b></a>

参数 | 规则 |	示例 |	详细解释
--- | --- | --- | ---
account |	{exchange}/{user_name} |	okex/demo
contract |	{exchange}/{base}.{quote}(.{delivery}) |	okex/btc.usdt或okef/btc.usd.n |	普通币币交易和杠杆交易两个币种用点（.）分隔，用quote货币计价来买卖base货币。合约交易在两个币种之后还要添加[交割时间标识](#期货交易代码)。
client_oid |	{contract}-{string} |	okex/btc.usdt-1234abcdABCD |	由用户指定，用于追踪订单信息。{string}是由 "A-Za-z0-9" 组成，最长28位最短12位的字符串。对于client_oid的支持与否各交易所有所不同，请参考交易所的[详细介绍](#exchange-details)，特殊格式要求的交易所: Gate的{string}为最长16位最短12位 。
exchange_oid |	{contract}-{string} |	okex/btc.usd-123或okef/btc.usd.n-123 |	由交易所生成，用于追踪订单信息。
exchange_tid |	{contract}-{string} |	quoinex/btc.jpy-12345 |	由交易所生成，用于追踪历史成交信息。

**币币交易代码**

币币交易代码由3部分组成，`{exchange}/{underlying}.{quote_currency}` 

> sample

```
binance/btc.usdt 表示币安交易所的usdt计价的btc交易
okex/eth.btc  表示okex交易所btc计价的eth交易
```

<a id='期货交易代码'><b>期货交易代码</b></a>

期货交易代码由4部分组成，`{exchange}/{underlying}.{quote_currency}.{delivery}`，bitmex交易所没有delivery的合约是该交易所指定交易对的参考指数。


交易代码 | 描述
--- | ---
okef/btc.usd.i | 表示ok交易所BTC合约的指数 i是index的缩写 指数不能交易 所以指数没有bid ask
okef/btc.usd.t | 表示ok交易所BTC当周合约 t是this week的缩写
okef/btc.usd.n | 表示ok交易所BTC次周合约 n是next week的缩写
okef/btc.usd.q | 表示ok交易所BTC当季合约 q是quarter的缩写
okef/btc.usd.b | 表示ok交易所BTC次季合约 b是biquarter的缩写
huobif/btc.usd.i | 表示huobi交易所BTC合约的指数 i是index的缩写 指数不能交易 所以指数没有bid ask
huobif/btc.usd.t | 表示huobi交易所BTC当周合约 t是this week的缩写
huobif/btc.usd.n | 表示huobi交易所BTC次周合约 n是next week的缩写
huobif/btc.usd.q | 表示huobi交易所BTC当季合约 q是quarter的缩写
okswap/btc.usd.td | 表示OKEx 交易所BTC的永续合约
bitmex/eth.btc.2018-06-29 |  表示bitmex交易所2018年6月29日到期的eth.btc合约
bitmex/btc.usd.td |          表示bitmex交易所btc.usd的掉期合约(永续合约)
btimex/btc.usd |             表示bitmex交易所btc.usd的参考指数 指数不能交易 所以指数没有bid ask
binancef/btc.usdt.td | 表示币安交易所btc.usdt的永续合约


<aside class="notice"> 
1. okef 里面的 f 是future的缩写.
2. okef的合约是连续的，当周交割后次周自动变为当周，因此不同时刻当周、次周、当季合约对应的到期日不是固定的。
</aside>

**部分标的代码变更**

为了让标的更加方便区分，我们对部分标的的代码做了调整，在调整过程中会陆续更新：

* bchsv => bsv

* bchabc => bch

* gxs => gxc

* miota => iota

## 数据结构

<b><a id='data-structure'>交易相关的数据结构</a></b>

**行情信息**

* Tick

> Tick

```json
{
     "asks":
     [
         {"price": 9218.5, "volume": 1.7371},
         ...
     ],
     "bids":
     [
         {"price": 9218.4, "volume": 0.81871728},
         ...
     ],
     "contract": "bitfinex/btc.usd",
     "last": 9219.3,  // 最新成交价
     "time": "2018-05-03T16:16:41.630400+08:00",  // 1Token的系统时间 ISO 格式 带时区
     "exchange_time": "2018-05-03T16:16:41.450400+08:00",  // 交易所给的时间 ISO 格式 带时区
     "amount": 16592.4,  //上一个snapshot到这一个snapshot中间的成交额 (CNY)
     "volume": 0.3   // 上一个snapshot到这一个snapshot中间的成交量
}
```

* 逐笔(Zhubi)

> 逐笔(Zhubi)

```json
[
     [
         {
             "price": 9218.5,
             "amount": 0.371, // 成交量(按币对， 比如这里是BTC的数量）， 这个地方暂时是amount 之后会改成volume 和tick统一起来
             "bs": "b",
             "contract": "bitfinex/btc.usd",
             "time": "2018-05-03T16:16:41.630400+08:00",  // 1Token的系统时间 ISO 格式 带时区
             "exchange_time": "2018-05-03T16:16:41.450400+08:00",  // 交易所给的时间 ISO 格式 带时区
         },
         ...
     ],
]
```

* 逐笔 V3 (Zhubi.v3)

> 逐笔 V3 (Zhubi.v3)

```json
[
     {
         "p": 9218.5,                          // price
         "a": 0.371,                           // 成交量(按币对， 比如这里是BTC的数量)
         "v": 21203.24,                        // 成交额（按CNY 计价）
         "bs": "b",                            // b for buy, s for sell
         "c": "bitfinex/btc.usd",              // contract
         "t": 1528435679.272815,               // 1Token 系统时间 (单位为秒 精确到微秒)
         "et": 1528435679.297,                 // exchange timestamp （单位为秒 精确到秒/毫秒/微妙 分交易所）
     },
     ...
]
```

**账户信息**

* OneToken支持3种不同的账户类型：现货账户，杠杆交易账户，期货账户


> 现货账户

```json
{
  "balance": 4362.166242423991,                 # 总资产 = 现金 + 虚拟货币市值
  "cash": 0.0,                                  # 现金（根据人民币汇率计算）
  "market_value": 4362.166242423991,            # 货币市值
  "market_value_detail": {                      # 每个币种的市值
    "btc": 0.0,
    "usdt": 0.0,
    "eth": 4362.166242423991
  },
  "position": [{                                # 货币持仓，默认包含btc，usdt或法币
      "total_amount": 1.0,                      # 总数
      "contract": "eth",                        # 币种
      "market_value": 4362.166242423991,        # 市值
      "available": 0.97,                        # 可用数量
      "frozen": 0.03,                           # 冻结数量
      "type": "spot"                            # 类型，spot表示现货持仓
    },
    {
      "total_amount": 0.0,
      "contract": "usdt",
      "market_value": 0.0,
      "available": 0.0,
      "frozen": 0.0,
      "type": "spot",
      "value_cny": 0.0
    },
    {
      "total_amount": 0.0,
      "contract": "btc",
      "market_value": 0.0,
      "available": 0.0,
      "frozen": 0.0,
      "type": "spot"
    }
  ]
}
```

> 杠杆交易账户

```json
{
    "balance": 589943.9724,                 # 总资产 = 现金 + 虚拟货币市值
    "cash": 6198.5392,                      # 现金（根据人民币汇率计算）
    "market_value: 583745.4332,             # 货币市值
    "market_value_detail: {                 # 市值详细情况
        eos: 583745.4332,
        usdt: 0
    },
    "position": [
        {
            "contract": "eos.usdt",         # "<coin>.<base>"
            "market_value": 583745.4332,    # 市值
            "amount_coin": 20071.4762,      # 总数
            "available_coin": 18971.4762,   # 可用数量
            "frozen_coin": 1100.0,          # 冻结数量
            "pl_coin": 0,                   # pl_coin = profit and lose (or interest) of coins
            "loan_coin": 0,                 # loan of coins
            "market_value_detail": {
                "eos": 583745.4332,
                "usdt": 0
            },
            "value_cny": 0,                 # CNY value of the contract (if available)
            "type": "margin",               # position type
            "mv_coin": 583745.4332,         # market value of coins
            "amount_base": 979.0929,        # total amount of the base currency
            "mv_base": 0,                   # market value of the base currency, 0 for USDT
            "available_base": 7029.3753,    # amount of the available base currency
            "frozen_base": 4511.19,         # frozen amount of the base currency
            "pl_base": -73.4164,            # pl_base = profit and lose (or interest) of the base currency
            "loan_base": -10448.056,        # loan of the base currency
            "value_cny_base": 6198.5392     # CNY value of the base currency (if available)
        },
        ...
    ]
}
```

> 期货账户

```json
{
  "balance": 4361345.793589303,                 # 总资产 = 现金 + 虚拟货币市值
  "cash": 0.0,                                  # 现金（根据人民币汇率计算）
  "market_value": 8728917.770172266,            # 虚拟货币市值
  "market_value_detail": {                      # 每个币种的市值
    "btc": 8728917.770172266,
    "usd": 0.0
  },
  "position": [{                                # 持仓，默认包含btc，usdt或法币现货
    "total_amount": 74.90222428,
    "contract": "btc",
    "market_value": 4361345.793589303,
    "available": 74.90222428,
    "frozen": 0.0,
    "type": "spot"
  }, {
    "total_amount": 0.0,
    "contract": "usd",
    "market_value": 0.0,
    "available": 0.0,
    "frozen": 0.0,
    "type": "spot",
    "value_cny": 0.0
  }, {
    "total_amount": 6904.0,                     # 总数
    "contract": "btc.usd.q",                    # 合约
    "market_value": 4367571.976582963,          # 市值
    "available": 6904.0,                        # 可用数量
    "frozen": 0.0,                              # 冻结数量
    "pl": 1.64417643,                           # profit and lose
    "market_value_detail": {                    #
      "btc": 4367571.976582963
    },
    "type": "future",                           # 类型，future表示期货持仓
    "total_xtc_amount": 75.00915342001107,      # 历史字段，请忽略
    "available_xtc": 75.00915342001107,         # 历史字段，请忽略
    "frozen_xtc": 0.0,                          # 历史字段，请忽略
    "available_long": 6905.0,                   # 多头仓位
    "available_short": 1.0                      # 空头仓位
  }]
}
```

* 订单信息

> 订单信息

```json
{
    "account": "binance/test_account",              # 账户名
    "contract": "binance/ltc.usdt",                 # 合约标识
    "bs": "b",                                      # "b"对应买或"s"对应卖
    "client_oid": "binance/ltc.usdt-xxx123",        # 由用户给定或由OneToken系统生成的订单追踪ID
    "exchange_oid": "binance/ltc.usdt-xxx456",      # 由交易所生成的订单追踪ID
    "status": "part-deal-pending",                  # 订单状态
    "entrust_price": 113,                           # 委托价格
    "entrust_amount": 10,                           # 委托数量
    "entrust_time": "2018-04-03T12:21:13+08:00",    # 下单时间
    "average_dealt_price": 112.1,                   # 平均成交价
    "dealt_amount": 1,                              # 成交数量
    "last_dealed_amount": 0.8,                      # 最近一次成交数量
    "commission": 0.0025,                           # 成交手续费
    "last_update": "2018-04-03T12:22:56+08:00",     # 最近更新时间
    "canceled_time": None,                          # 撤单时间
    "options": {},                                  #
    "comment": "string",                            #
    "tags": {}                                      #
}
```

* 成交记录

> 成交记录

```json
{
    "account": "binance/test_account",                  # 账户名
    "contract": "binance/ltc.usdt",                     # 合约标识
    "bs": "b",                                          # "b"对应买或"s"对应卖
    "client_oid": "binance/ltc.usdt-xxx123",            # 由用户给定或由OneToken系统生成的订单追踪ID
    "exchange_oid": "binance/ltc.usdt-xxx456",          # 由交易所生成的订单追踪ID
    "exchange_tid": "binance/ltc.usdt-xxx789",          # 由交易所生成的成交ID
    "dealt_amount": 1,                                  # 成交数量
    "dealt_price": 0,                                   # 成交价格
    "dealt_time": "2018-04-03T12:22:56+08:00",          # 成交时间
    "dealt_type": "maker",                              # 主动成交"taker"、被动成交"maker"
    "commission": 0.0025,                               # 成交手续费
    "commission_currency": "ltc",                       # 手续费币种
    "tags": {}                                          #
}
```

<aside class="notice">实际返回与文档不匹配的字段可能已废弃，请勿使用。</aside>

## 错误码

### 1Token 错误码

错误代码 |	解释
--- | ---
invalid-white-list |	错误的白名单 ip, 1Token 并不支持的 ip
invalid-jwt |	错误的用户 jwt
invalid-api-key |	错误用户 ot-key, ot-secret
no-valid-authentication |	无可用的用户认证(jwt 或 api_key)
no-permission |	无权限访问
not-allowed |	有权限但当前资源不可用
partial-success |	batch operations 部分成功
unexpected-error |	1Token 系统内部错误
invalid-param |	错误的 1Token 的参数
client_oid-not-found |	指定的 client order id 不存在
client_oid-already-existed |	指定的 client order id 已经存在
exchange_oid-not-found |	指定的 exchange order id 不存在，或根据 client order id 没有找到对应的 exchange order id
client_wid-not-found |	指定的 client withdraw id 不存在
client_wid-already-existed |	指定的 client withdraw id 已经存在
exchange_wid-not-found |	指定的 exchange withdraw id 不存在，或根据 client withdraw id 没有找到对应的 exchange withdraw id
contract-not-exist |	指定的 contract 不存在或不可用
invalid-account-config |	错误的 account config
wait-for-initializing |	等待账户后台初始化
upstream-error |	上层ot服务不可用
no-available-proxy |	无可用 proxy-ip 出口
proxy-ip-banned |	proxy-ip 已经被暂时禁用
proxy-connect-fail |	连接 proxy 失败

**第三方交易所相关的错误码**

错误代码 |	解释
--- | ---
exg-account-error |	账户被冻结,被禁止使用等错误
exg-invalid-api-key |	无效的API key
exg-rate-limit-exceeded |	请求超出交易所限制
exg-invalid-param |	交易所接受参数错误
exg-unexpected-data-format |	交易所返回错误的数据格式
exg-place-order-no-money |	账户资金不足
exg-place-order-min-notional |	账户下单金额低于交易所最低限制
exg-place-order-error-amount |	账户下单数量错误
exg-place-order-error-price |	账户下单价格错误
exg-cancel-order-not-exist |	订单已被撤销或订单不存在
exg-undefined-error |	还没有及时被 ot 系统识别的错误
exg-timeout |	访问交易所超时
exg-unknown-error |	交易所系统错误, 状态不明
exg-bad-gateway |	交易所 bad-gateway

## 订单状态流程

![](https://1token.trade/docs/img/order-status-cn.png)

## 交易所支持范围

<b><a id="支持的交易所">支持的交易所</a></b>

交易所 |	交易类型 |	交易所 Symbol |	国家
--- | --- | ---  | --- | --- | ---
[Bibox](https://www.bibox.com/) |	币币交易 |	bibox |	中国
[币安 Binance](https://www.binance.com/) |	币币交易 |	binance |	日本
 | 永续合约交易 | binancef | 日本
[Bitflyer](https://bitflyer.jp/) |	现货交易 |	bitflyer |	日本
 | 合约交易 |	bitflyex |	日本
[Bithumb](https://www.bithumb.com/) |	现货交易 |	bithumb |	韩国
[Bitmex](https://www.bitmex.com/) |	合约交易 |	bitmex |	塞舌尔
[Bittrex](https://bittrex.com/) |	币币交易 |	bittrex |	美国
[Gate](https://gate.io/) |	币币交易 |	gate |	中国
[火币 Huobi](https://www.huobi.pro/) |	币币交易 |	huobip |	新加坡
 | 杠杆交易 |	huobim |		新加坡
 | 交割合约交易 |	huobif |	新加坡
 | 永续合约交易 |	huobiswap | 新加坡
[OKEX](https://www.okex.com/) |	币币交易 |	okex |		中国, 美国
 | 交割合约交易 |	okef |	中国, 美国
 | 永续合约交易 |	okswap |	中国, 美国
[Poloniex](https://www.poloniex.com/) |	币币交易 |	poloniex |	美国
 | 杠杆交易 |	尚未支持 	 |	美国
[Quoinex](https://quoinex.com/) |	币币交易 |	quoinex  |	日本
[ZB](https://zb.com/) |	币币交易 |	zb  |	中国

<aside class="notice">各交易所详细说明<a href='#exchange-details'>点此跳转</a>。</aside>

### 期货交易所

目前支持的期货交易所：okex的合约交易、huobi的合约交易、binance的合约交易、bitmex的期货。

* okex的期货合约，支持当周、次周、当季以及永续合约，具体交易规则可以参考OKex[说明文档](https://support.okex.com/hc/zh-cn/articles/115001627231-%E4%BB%80%E4%B9%88%E6%98%AF%E8%99%9A%E6%8B%9F%E5%90%88%E7%BA%A6-%E5%A6%82%E4%BD%95%E4%BA%A4%E6%98%93-)。
* bitmex期货合约[说明文档](https://www.bitmex.com/app/tradingOverview)。

## 交易所详细介绍

<b><a id="exchange-details">交易所详细介绍</a></b>

1Token目前支持目前市场上的一级交易所，包括火币、币安、OKEX等。

需要注意的是每个交易所都有细微的差异，以下文档详细说明了各个交易所的差异。

`client_oid`仅在交易所支持`client_oid`时可用，在交易所详情中会标明交易所是否支持`client_oid`。由于`client_oid`重复时各个交易所行为不一致，所以请勿使用重复的`client_oid`。请参考[命名规则](#naming-rules)。

### 币安(代码: binance)

**行情**

币安的orderbook 限制了只会每秒来一个, 但是逐笔数据是实时的, 所以如果想要判断最及时的行情 可以使用逐笔数据

**交易**

* 请求限制每个ip的weight
* 一般接口限制每个ip的weight累加不得超过**每分钟1200**
* 交易接口限制每个账号**每秒10单，每天限制100000单**
* 单个交易对支持最近**500条**历史成交记录
* 币安会对下单使用机器学习的限制 具体详见[币安API交易规则说明](#https://support.binance.com/hc/zh-cn/articles/115003235691-%E5%B8%81%E5%AE%89API%E4%BA%A4%E6%98%93%E8%A7%84%E5%88%99%E8%AF%B4%E6%98%8E)
* websocket 推送才能拿到所有的挂单
* 支持client_oid

### 币安(永续合约)(代码: binancef)

* 请求限制每个ip的weight
* 一般接口限制每个ip的weight累加不得超过每分钟1200
* 单个交易对支持最近100条历史成交记录
* 支持client_oid

### 火币(代码: huobip(币币交易), huobim(杠杆交易))

* 可以查询所有的挂单 但是这个方法在火币的document里面是不存在的（他们doc要求一定要传入contract） 所以查询所有挂单这个请求可能失效
* 查询订单信息时如果不添加contract会返回所有交易对的订单
* 单个交易对支持最近**1天**的成交记录
* 限制每个交易接口*10秒最多100次请求* 按用户限制
* 火币现在没有提供websocket接口。所有查询都是通过rest的

### HBDM(火币交割合约)(代码: huobif)

### HBDM(火币永续合约)(代码: huobiswap)

### OKEX(现货)(代码: okex)

* 单个交易对支持最近**2天**的成交记录
* 不支持查询成交记录 (dealt-trans接口)
* 不支持拿所有的挂单
* okex 有v1和v3两种API 1Token目前支持v1的API, v3的API在测试中 预期2019年夏季上线

### OKEX(交割合约)(代码: okef)

* 现阶段只支持全仓模式。自行在用户中心开通的账户不可调杠杆，如需调整杠杆可联系客服。
* 开仓和平仓的选择：在options 参数中填写 open: true 或 close: true，具体请参考[Swagger Quote API](https://1token.trade/r/swagger?url=/r/swagger/quote.yml)中，创建订单部分
* 如果不发送开平仓参数，则每次下单前会检查是否有足够仓位可以平仓 如果有的话 会尝试平仓，如果仓位不够平仓 则会主动开仓
  * 例子，如果现在持有2张多头 请求 sell 1张 则会去平掉这一张
  * 例子，如果现在持有2张多头 请求 sell 3张 则会开出3张空单

### OKEX(永续合约)(代码: okswap)

### Gate(代码: gate)

* 用contract查询订单信息仅支持以下3种状态：pending, part-deal-pending, active
* 撤单时向交易所发送无效的exchange_oid(比如已经撤掉的单子)也会返回撤单成功，不会返回错误。
* 单个交易对支持最近**1天**的成交记录
* 交易所下单之后 要过两三秒钟才能查询到撤单
* client_oid有长度限制，由用户指定的{string}最大长度16位
* 支持client_oid下单，不支持client_oid查/撤单

### ZB(代码: zb)

* 不支持dealt-trans，交易所完全没有成交记录这个概念, 网页上可以查询到账单，但是API并不提供支持
* 杠杆交易尚未支持
* 不支持client_oid

### bithumb(代码: bithumb)

### BitMEX(代码: bitmex)

* 交易频繁/行情剧烈的时候 bitmex经常会system overload
* bitmex 普通时候 交易数秒才能返回 都是正常的 (不是网络因素 他们系统的因素)
* bitmex 对用户的请求有非常严格的限制 任何400错误都需要被优雅的处理 如果您的API连续发出了400错误, API会被BitMEX封锁

### BITTREX(代码: bittrex)

* 查询订单信息**无法获得entrust_price**
* 限制最多同时**500个**未成交订单
* 限制每天最多下**200000单**

### Poloniex(代码：poloniex)

* 用contract查询订单信息仅支持以下3种状态：pending, part-deal-pending, active
* 单个交易对支持最近**1天**的成交记录

### Bibox(代码: bibox)

## 网络相关

<b><a id='网络相关'>网络相关</a></b>

* 1Token的主节点部署在香港阿里云服务器 另外一些辅助代理节点部署在全球各大交易所地理位置周边

* <https://1token.trade> 使用了CloudFlare作为CDN 由于CDN节点都部署在海外, 从国内服务器/终端直连可能会被墙出现连接失败等现象，推荐程序化交易的用户使用海外服务器。

* 国内调试推荐使用`https://cdn.1tokentrade.cn/api/v1` 这台前置节点在上海阿里云, 通过VPN和1Token香港阿里云之间连接, 中间的网络由于GFW的关系而抖动, **请勿在生产环境使用**。比如<https://cdn.1tokentrade.cn/api/v1/basic/time>

* 1Token服务器到主流交易所的延时（毫秒）

 参数 | 币安	| 火币	| OKEX现货	| OKEX合约	| BITMEX
--- | --- | --- | --- | --- | --- 
延时(ms)	| 60	| 90	| 20	| 20	| 310

## 缓存机制

* 由于交易所存在访问接口频率限制，在用户连续请求余额/仓位等数据时，1Token会缓存数据以避免访问超速，因此获取数据会有一定的延时。

* 数据延时通常在几十毫秒到几百毫秒，视交易所及网络的情况而定，当市场波动较大或交易所服务器卡顿时，可能会由于拿不到最新数据而使延时达到数秒。

# 更多

## 添加白名单

### 给key和secret加保险

推荐在其他交易所生成api-key与api-secret时，将下方所列经认证为1Token所持有的ip地址加入该key-secret的白名单，以确保只有1Token可以使用该key-secret进行交易。这样，就算key与secret不慎被盗，别人也无法通过白名单之外的设备进行交易，从而更高地保护您的个人财产。

以火币Huobi为例

1.在生成`key`, `secret`时填入1Token持有的ip中的一个或多个。如下图中将生成一对专供在1Token交易使用的`key`, `secret`，我们将他命名为**1Token**，并将[1Token持有的ip](https://1token.trade/api/v1/basic/ip-pool)中的一个或几个填入图中的指定ip地址。

以下假设用户将添加的白名单ip为`12.34.56.78`(用户在实际操作时，请务必确认所填入的IP在[IP列表](https://1token.trade/api/v1/basic/ip-pool)中能够查到)。

![step1](https://1token.trade/docs/img/add-white-list-ip.png)

2.生成并确认

![step2](https://1token.trade/docs/img/success.png)

![step3](https://1token.trade/docs/img/my-key.png)

3.在1Token官网的账户管理中添加该账户，并将`key`, `secret`以及`白名单IP`填入。此处的白名单ip与第一步中在huobi填入的ip应该一致，否则1Token将无法得知应当使用哪台机器来完成本对`key-secret`相关操作。在第一步中我们填入了`12.34.56.78`，则在此处填入相同的IP。

![step4](https://1token.trade/docs/img/add_in_1token.png)

4.之后可在账户的api列表中查看刚添加的一项。可以看到，在ip一项里有第一步中填入的ip`12.34.56.78`，至此，白名单的添加就完成了。

![step5](https://1token.trade/docs/img/api-key-list.png)

这样子就只有通过`12.34.56.78`这个ip发出的交易请求才会被huobi接受，大大增加了个人账户的安全性。

### 注意

用户在实际操作时，请务必确认所填入的IP在[IP列表](https://1token.trade/api/v1/basic/ip-pool)中能够查到

后续的使用请参考通过[1Token网页进行交易](#website-user)或是通过[1Token API进行交易](#通过API来进行交易)。

### 1Token持有的ip

请参考ip列表 <https://1token.trade/api/v1/basic/ip-pool>