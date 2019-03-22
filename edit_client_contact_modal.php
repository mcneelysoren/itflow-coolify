<div class="modal fade" id="editClientContactModal<?php echo $client_contact_id; ?>" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><i class="fa fa-user-edit"></i> Edit Contact</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="post.php" method="post" autocomplete="off">
        <input type="hidden" name="client_contact_id" value="<?php echo $client_contact_id; ?>">
        <div class="modal-body">    
          <div class="form-group">
            <label>Name</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fa fa-user"></i></span>
              </div>
              <input type="text" class="form-control" name="name" placeholder="Full Name" value="<?php echo $client_contact_name; ?>" required>
            </div>
          </div>
          
          <div class="form-group">
            <label>Title</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fa fa-id-badge"></i></span>
              </div>
              <input type="text" class="form-control" name="title" placeholder="Title" value="<?php echo $client_contact_title; ?>" required>
            </div>
          </div>
        
          <div class="form-group">
            <label>Phone</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fa fa-phone"></i></span>
              </div>
              <input type="text" class="form-control" name="phone" placeholder="Phone Number" data-inputmask="'mask': '999-999-9999'" value="<?php echo $client_contact_phone; ?>" required> 
            </div>
          </div>

          <div class="form-group">
            <label>Email</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fa fa-envelope"></i></span>
              </div>
              <input type="email" class="form-control" name="email" placeholder="Email Address" value="<?php echo $client_contact_email; ?>" required>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          <button type="submit" name="edit_client_contact" class="btn btn-primary">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>