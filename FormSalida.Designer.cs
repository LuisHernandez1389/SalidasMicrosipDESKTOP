namespace MiProyectoMicrosip
{
    partial class FormSalida
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.ComboBox comboBox2;
        private System.Windows.Forms.ComboBox comboBox3;
        private System.Windows.Forms.Label labelConceptos;
        private System.Windows.Forms.Label labelAlmacen;
        private System.Windows.Forms.Label labelDestino;
        private System.Windows.Forms.TextBox textBoxFolio;
        private System.Windows.Forms.Label labelFolio;
        private System.Windows.Forms.DateTimePicker dateTimePickerFecha;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridView dataGridViewArticulos;
        private System.Windows.Forms.Button buttonGenerarSalida;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            comboBox1 = new ComboBox();
            comboBox2 = new ComboBox();
            comboBox3 = new ComboBox();
            labelConceptos = new Label();
            labelAlmacen = new Label();
            labelDestino = new Label();
            textBoxFolio = new TextBox();
            labelFolio = new Label();
            dateTimePickerFecha = new DateTimePicker();
            label1 = new Label();
            textBox1 = new TextBox();
            label2 = new Label();
            dataGridViewArticulos = new DataGridView();
            buttonGenerarSalida = new Button();
            ((System.ComponentModel.ISupportInitialize)(dataGridViewArticulos)).BeginInit();
            SuspendLayout();

            // 
            // comboBox1
            // 
            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox1.FormattingEnabled = true;
            comboBox1.Location = new Point(20, 48);
            comboBox1.Margin = new Padding(5, 6, 5, 6);
            comboBox1.Name = "comboBox1";
            comboBox1.Size = new Size(431, 33);
            comboBox1.TabIndex = 0;
            // 
            // comboBox2
            // 
            comboBox2.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox2.FormattingEnabled = true;
            comboBox2.Location = new Point(20, 123);
            comboBox2.Margin = new Padding(5, 6, 5, 6);
            comboBox2.Name = "comboBox2";
            comboBox2.Size = new Size(431, 33);
            comboBox2.TabIndex = 1;
            // 
            // comboBox3
            // 
            comboBox3.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox3.FormattingEnabled = true;
            comboBox3.Location = new Point(20, 198);
            comboBox3.Margin = new Padding(5, 6, 5, 6);
            comboBox3.Name = "comboBox3";
            comboBox3.Size = new Size(431, 33);
            comboBox3.TabIndex = 2;
            // 
            // labelConceptos
            // 
            labelConceptos.AutoSize = true;
            labelConceptos.Location = new Point(20, 17);
            labelConceptos.Margin = new Padding(5, 0, 5, 0);
            labelConceptos.Name = "labelConceptos";
            labelConceptos.Size = new Size(97, 25);
            labelConceptos.TabIndex = 3;
            labelConceptos.Text = "Conceptos";
            // 
            // labelAlmacen
            // 
            labelAlmacen.AutoSize = true;
            labelAlmacen.Location = new Point(20, 92);
            labelAlmacen.Margin = new Padding(5, 0, 5, 0);
            labelAlmacen.Name = "labelAlmacen";
            labelAlmacen.Size = new Size(80, 25);
            labelAlmacen.TabIndex = 4;
            labelAlmacen.Text = "Almacén";
            // 
            // labelDestino
            // 
            labelDestino.AutoSize = true;
            labelDestino.Location = new Point(20, 167);
            labelDestino.Margin = new Padding(5, 0, 5, 0);
            labelDestino.Name = "labelDestino";
            labelDestino.Size = new Size(73, 25);
            labelDestino.TabIndex = 5;
            labelDestino.Text = "Destino";
            // 
            // textBoxFolio
            // 
            textBoxFolio.Location = new Point(1089, 50);
            textBoxFolio.Margin = new Padding(5, 6, 5, 6);
            textBoxFolio.Name = "textBoxFolio";
            textBoxFolio.Size = new Size(138, 31);
            textBoxFolio.TabIndex = 6;
            // 
            // labelFolio
            // 
            labelFolio.AutoSize = true;
            labelFolio.Location = new Point(1136, 19);
            labelFolio.Margin = new Padding(5, 0, 5, 0);
            labelFolio.Name = "labelFolio";
            labelFolio.Size = new Size(51, 25);
            labelFolio.TabIndex = 7;
            labelFolio.Text = "Folio";
            // 
            // dateTimePickerFecha
            // 
            dateTimePickerFecha.Location = new Point(704, 50);
            dateTimePickerFecha.Name = "dateTimePickerFecha";
            dateTimePickerFecha.Size = new Size(347, 31);
            dateTimePickerFecha.TabIndex = 8;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(859, 17);
            label1.Margin = new Padding(5, 0, 5, 0);
            label1.Name = "label1";
            label1.Size = new Size(57, 25);
            label1.TabIndex = 9;
            label1.Text = "Fecha";
            // 
            // textBox1
            // 
            textBox1.Location = new Point(695, 146);
            textBox1.Margin = new Padding(5, 6, 5, 6);
            textBox1.Multiline = true;
            textBox1.Name = "textBox1";
            textBox1.Size = new Size(532, 85);
            textBox1.TabIndex = 10;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(906, 115);
            label2.Margin = new Padding(5, 0, 5, 0);
            label2.Name = "label2";
            label2.Size = new Size(104, 25);
            label2.TabIndex = 11;
            label2.Text = "Descripcion";
            // 
            // dataGridViewArticulos
            // 
            dataGridViewArticulos.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewArticulos.Columns.AddRange(new DataGridViewColumn[] {
                new DataGridViewTextBoxColumn { Name = "ClaveArticulo", HeaderText = "Clave del Artículo" },
                new DataGridViewTextBoxColumn { Name = "NombreArticulo", HeaderText = "Nombre del Artículo" },
                new DataGridViewTextBoxColumn { Name = "Unidades", HeaderText = "Unidades" },
                new DataGridViewTextBoxColumn { Name = "ArticuloId", HeaderText = "ID del Artículo" }
            });
            dataGridViewArticulos.Location = new Point(20, 250);
            dataGridViewArticulos.Name = "dataGridViewArticulos";
            dataGridViewArticulos.RowHeadersWidth = 62;
            dataGridViewArticulos.RowTemplate.Height = 33;
            dataGridViewArticulos.Size = new Size(1207, 250);
            dataGridViewArticulos.TabIndex = 12;
            // 
            // buttonGenerarSalida
            // 
            buttonGenerarSalida.Location = new Point(20, 520);
            buttonGenerarSalida.Name = "buttonGenerarSalida";
            buttonGenerarSalida.Size = new Size(150, 40);
            buttonGenerarSalida.TabIndex = 13;
            buttonGenerarSalida.Text = "Generar Salida";
            buttonGenerarSalida.UseVisualStyleBackColor = true;
            buttonGenerarSalida.Click += new System.EventHandler(this.buttonGenerarSalida_Click);
            // 
            // FormSalida
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1257, 651);
            Controls.Add(buttonGenerarSalida);
            Controls.Add(dataGridViewArticulos);
            Controls.Add(label2);
            Controls.Add(textBox1);
            Controls.Add(label1);
            Controls.Add(dateTimePickerFecha);
            Controls.Add(labelFolio);
            Controls.Add(textBoxFolio);
            Controls.Add(labelDestino);
            Controls.Add(labelAlmacen);
            Controls.Add(labelConceptos);
            Controls.Add(comboBox3);
            Controls.Add(comboBox2);
            Controls.Add(comboBox1);
            Margin = new Padding(5, 6, 5, 6);
            Name = "FormSalida";
            Text = "FormSalida";
            Load += FormSalida_Load;
            ((System.ComponentModel.ISupportInitialize)(dataGridViewArticulos)).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion
    }
}
