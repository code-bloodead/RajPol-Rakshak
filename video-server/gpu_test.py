import tensorflow as tf
from models.device import current_device
from tensorflow.python.client import device_lib

print("Using:", current_device)

# print(tf.test.is_built_with_cuda())
# print(tf.test.is_built_with_rocm())
# print(tf.test.is_built_with_gpu_support())
print(tf.test.is_built_with_xla())
print(tf.config.list_physical_devices('GPU'))
print(device_lib.list_local_devices())

