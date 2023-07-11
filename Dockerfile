FROM --platform=linux/amd64 ghcr.io/huggingface/text-generation-inference:0.8.2
RUN pip install sacremoses
