# locust-terraform
負荷試験ツール`Locust`を、AWSのFargate上で実行する環境を構築するTerraformです。<br>
terraformを実行すると、以下のような環境が構築されます。

[構成図](https://github.com/tomozo6/locust-terraform/blob/master/document/locust.png)

## Prerequisites
- Terraform 0.12+

## Installing the locust-terraform
```
$ git clone https://github.com/tomozo6/locust-terraform.git
$ cd ./locust-terraform
$ terraform init
$ terraform apply
```

## Uninstalling the locust-terraform
```
$ terraform destory
```

## Configuration
次の表に、 locals.tfにて変更可能なパラメーターとそのデフォルト値を示します。
| Parameter | Description | Default |
|:---|:---|:---|
|`general_name` |各リソースを構築する際のベースとなるネーミング |`locust` |
|`tags` |各リソースに設定するタグ |`{"created_by"   = "terraform", "general_name" = local.general_name}`|
|`vpc_cidr`|VPCのcidr|`"192.168.0.0/16"`|
|`public_cidr`|Publicサブネットのcidr|`["192.168.0.0/24","192.168.1.0/24","192.168.2.0/24"]`|
|`locust.image`|locustのdockerイメージ|`"tomozo6/locust:0.0.1"`|
|`locust.script_path`|負荷試験で使用するスクリプト名|`"/scripts/locustfile.py"`|
|`master.cpu`|locustマスターコンテナに割り当てるCPU量|`256`|
|`master.memory`|locustマスターコンテナに割り当てるメモリ量|`512`|
|`master.desired_count`|locustマスターコンテナの希望数。変更する必要無し。|`1`|
|`worker.cpu`|locustワーカーコンテナに割り当てるCPU量|`256`|
|`worker.memory`|locustワーカーコンテナに割り当てるメモリ量|`512`|
|`worker.desired_count`|locustワーカーコンテナの希望数。|`2`|
