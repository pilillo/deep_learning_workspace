docker run --runtime=nvidia -it -p 8888:8888 \
-v /home/pilillo/Documenti/deep_learning_workspace/workspace:/notebooks/workspace \
--memory="60g" --memory-swap="60g" \
pilillo/deep_learning_workspace:0.1

#docker run --runtime=nvidia -it -p 8888:8888 \
#-v /home/pilillo/Documenti/deep_learning_workspace/workspace:/notebooks/workspace \
#--entrypoint bash \
#--memory="60g" --memory-swap="60g" \
#pilillo/deep_learning_workspace:0.1

#docker run --runtime=nvidia -it -p 8888:8888 \
#-v /home/pilillo/Documenti/deep_learning_workspace/workspace:/notebooks/workspace \
#--entrypoint bash \
#--memory="60g" --memory-swap="60g" \
#tensorflow/tensorflow:latest-gpu
