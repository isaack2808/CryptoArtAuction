import sys
import hashlib
if sys.version_info < (3,4):
   import sha3
   
from sha3 import keccak_256
sha3_hash = keccak_256("baz(uint32,bool)").hexdigest()
method_id = "0x"+sha3_hash[:8]
print (method_id)
