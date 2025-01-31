# たまにこれでエラーになる
rm -rf ~/.docker/config.json

# いらないものを適宜削除
docker rm $(docker ps -q -a)
docker rmi $(docker images -q)
docker image prune
docker container prune
docker volume prune
docker network prune
docker system df

# Dockerイメージを更新
docker build -t koki/sctensor-experiments .

# DockerHubに最新版をプッシュ
docker login -u koki -p medical
img=`docker images | grep koki/sctensor-experiments | awk '{print $3}'`
docker tag $img koki/sctensor-experiments:latest
docker push koki/sctensor-experiments:latest

# 中に入って動作確認する時用
# docker run -it --rm koki/sctensor-experiments:latest /bin/bash