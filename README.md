
<p align="center">
<a href="https://twitter.com/xyizko" target="_blank">
<img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fxyizko%2Fxo-rel-s-rd&count_bg=%2360194E&title_bg=%23DD1B1B&icon=rss.svg&icon_color=%23E7E7E7&title=kills&edge_flat=false"/>
</a>

<p align="center">
<img src="./gfx/1.gif" width="1200">
</p>

<h1 align="center"><code>xo-rel-s-rd</code></h1>
<h2 align="center"><i> Bash Script to remove docker elements </i></h2>

1. [What ?](#what-)
2. [Usage](#usage)
   1. [For `*nix`](#for-nix)
   2. [Fow `Windows`](#fow-windows)
3. [License](#license)


# What ? 

> [!CAUTION]
> Will stop and remove all docker elements. Do not use if only specific ones need to be removed


Simple bash script to remove all docker :
1. Stop all containers and images 
2. Delete all container and images 
3. Delete all volumes

# Usage

| File                                               | OS                       |
| -------------------------------------------------- | ------------------------ |
| [`docker_cleanup.sh`](./filez/docker_cleanup.sh)   | For `*nix`               |
| [`docker_cleanup.ps1`](./filez/docker_cleanup.ps1) | For `Windows Powershell` |

## For `*nix` 

1. Download [`docker_cleanup.sh`](./filez/docker_cleanup.sh) - _Bash Script_

2. Execute 

```js 
bash dockerREM.sh
``` 

## Fow `Windows`

1. Download [`docker_cleanup.ps1`](./filez/docker_cleanup.ps1) - _Powershell Script_

2. You might need to alter `Set-ExecutionPolicy` - You will need a powershell with `Admin` previliges (right click `Run as Administrator`). Then enter the following 

```powershell
Set-ExecutionPolicy RemoteSigned
```
3. Then run

```powershell
./script.ps1
```
- This should perform the operations

- After this is done set it back to `restricted` for security

> [!WARNING]
> Please ensure you are changing the policy for the correct `user`

```powershell 
Get-ExecutionPolicy
```
- this should now show `RemoteSigned`
- Then do the following and enter `Restricted`

```powershell
 ❯ Set-ExcutionPolicy -Scope CurrentUser
---
cmdlet Set-ExecutionPolicy at command pipeline position 1
Supply values for the following parameters:
ExecutionPolicy: Restricted
---
❯ Get-ExecutionPolicy
Restricted
```


# License 

[`License`](https://github.com/xyizko/xo-liz/blob/main/liz/L2.MD)
