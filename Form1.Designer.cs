namespace MiProyectoMicrosip
{
    partial class Form1
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.TextBox txtDatabasePath;
        private System.Windows.Forms.TextBox txtUsername;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.TextBox txtServer;
        private System.Windows.Forms.Button btnConnect;
        private System.Windows.Forms.Label lblMessage;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.txtDatabasePath = new System.Windows.Forms.TextBox();
            this.txtUsername = new System.Windows.Forms.TextBox();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.txtServer = new System.Windows.Forms.TextBox();
            this.btnConnect = new System.Windows.Forms.Button();
            this.lblMessage = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // txtDatabasePath
            // 
            this.txtDatabasePath.Location = new System.Drawing.Point(12, 12);
            this.txtDatabasePath.Name = "txtDatabasePath";
            this.txtDatabasePath.Size = new System.Drawing.Size(260, 20);
            this.txtDatabasePath.TabIndex = 0;
            this.txtDatabasePath.Text = "C:\\Microsip datos\\SUPER CARQUIN.FDB";
            // 
            // txtUsername
            // 
            this.txtUsername.Location = new System.Drawing.Point(12, 38);
            this.txtUsername.Name = "txtUsername";
            this.txtUsername.Size = new System.Drawing.Size(260, 20);
            this.txtUsername.TabIndex = 1;
            this.txtUsername.Text = "SYSDBA";
            // 
            // txtPassword
            // 
            this.txtPassword.Location = new System.Drawing.Point(12, 64);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.Size = new System.Drawing.Size(260, 20);
            this.txtPassword.TabIndex = 2;
            this.txtPassword.Text = "masterkey";
            this.txtPassword.UseSystemPasswordChar = true;
            // 
            // txtServer
            // 
            this.txtServer.Location = new System.Drawing.Point(12, 90);
            this.txtServer.Name = "txtServer";
            this.txtServer.Size = new System.Drawing.Size(260, 20);
            this.txtServer.TabIndex = 3;
            this.txtServer.Text = "server";
            // 
            // btnConnect
            // 
            this.btnConnect.Location = new System.Drawing.Point(12, 116);
            this.btnConnect.Name = "btnConnect";
            this.btnConnect.Size = new System.Drawing.Size(260, 23);
            this.btnConnect.TabIndex = 4;
            this.btnConnect.Text = "Conectar";
            this.btnConnect.UseVisualStyleBackColor = true;
            this.btnConnect.Click += new System.EventHandler(this.btnConnect_Click);
            // 
            // lblMessage
            // 
            this.lblMessage.AutoSize = true;
            this.lblMessage.Location = new System.Drawing.Point(12, 142);
            this.lblMessage.Name = "lblMessage";
            this.lblMessage.Size = new System.Drawing.Size(50, 13);
            this.lblMessage.TabIndex = 5;
            this.lblMessage.Text = "Mensaje:";
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 161);
            this.Controls.Add(this.lblMessage);
            this.Controls.Add(this.btnConnect);
            this.Controls.Add(this.txtServer);
            this.Controls.Add(this.txtPassword);
            this.Controls.Add(this.txtUsername);
            this.Controls.Add(this.txtDatabasePath);
            this.Name = "MainForm";
            this.Text = "Conexión Microsip";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();
        }
    }
}
