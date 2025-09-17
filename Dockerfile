
# 使用与项目兼容的 Java 17 基础镜像
FROM openjdk:17-jdk

# 将项目打包后的文件复制到镜像中
# 该命令与项目特有的打包结构相匹配
COPY ./target/crm9-release/crm9 /crm9

# 设置工作目录，方便后续命令使用相对路径
WORKDIR /crm9

# 声明应用将要监听的端口
# 如果您的应用实际监听8080，请修改为 EXPOSE 8080
EXPOSE 80

# 启动应用
# -cp 使用相对路径，更简洁
CMD java -Xverify:none -cp ./config:./lib/* com.kakarote.crm9.Application

# 运行应用
ENTRYPOINT ["java","-jar","/app.jar"]
