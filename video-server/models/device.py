
import torch


detected_device = 'cuda' if torch.cuda.is_available() else "mps" if torch.backends.mps.is_available() else "cpu"

# current_device = "cpu"
# current_device = "gpu"
# current_device = "mps"
current_device = detected_device
# if current_device == "mps":
#   current_device = "cpu"  # NOTE: MPS is not working :(
  
print(f"Using {current_device}")

# model.to(device)
