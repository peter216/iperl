package AOL::EmailTable;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT = qw(
  add_headers
  add_rows
  build_table
);


my $DEFAULT_TABLE_STYLE = "background-color: #ffffff; border: 1px solid #87835A; border-spacing: 4px; margin-left: auto; margin-right: auto;";
my $DEFAULT_HEADER_STYLE = "background-color: #87835A; font-weight: bold; color: #fff;";
my $DEFAULT_ODD_ROW_STYLE = "background-color: #F3F3F3;";
my $DEFAULT_EVEN_ROW_STYLE = "background-color: #ddd;";
my $DEFAULT_COLUMN_SEPARATOR = 2;

sub new {
  my ($class, %args) = @_;

  my $self = {};
  bless($self, $class);

  $self->{table_style} = $args{table_style} || $DEFAULT_TABLE_STYLE;
  $self->{header_style} = $args{header_style} || $DEFAULT_HEADER_STYLE;
  $self->{odd_row_style} = $args{odd_row_style} || $DEFAULT_ODD_ROW_STYLE;
  $self->{even_row_style} = $args{even_row_style} || $DEFAULT_EVEN_ROW_STYLE;
  $self->{column_separator} =
    $args{column_separator} || $DEFAULT_COLUMN_SEPARATOR;

  $self->{html} = '';
  $self->{text} = '';

  $self->{headers} = [];
  $self->{rows} = [];
  $self->{column_widths} = [];

  return $self;
}


sub add_headers {
  my ($self, $headers) = @_;

  if (ref($headers) eq 'ARRAY') {
    push(@{$self->{headers}}, @$headers);
  }
  else {
    push(@{$self->{headers}}, $headers);
  }
}


sub add_rows {
  my ($self, $rows) = @_;

  if (ref($rows) eq 'ARRAY') {
    push(@{$self->{rows}}, @$rows);
  }
  else {
    push(@{$self->{rows}}, $rows);
  }
}


sub build_table {
  my ($self) = @_;

  $self->find_max_column_widths();

  my $style = ($self->{table_style}) ? " style=\"$self->{table_style}\"" : '';
  $self->{html} .= "<table$style>\n";
  $self->table_headers();
  $self->table_rows();

  $self->{html} .= "</table>\n";
}


sub find_max_column_widths {
  my ($self) = @_;

  for (my $ndx = 0; $ndx < scalar(@{$self->{headers}}); $ndx++) {
    $self->set_column_width($ndx, length($self->{headers}[$ndx]));
  }

  foreach my $row (@{$self->{rows}}) {
    for (my $ndx = 0; $ndx < scalar(@$row); $ndx++) {
      $self->set_column_width($ndx, length($row->[$ndx]));
    }
  }
}


sub set_column_width {
  my ($self, $ndx, $width) = @_;

  if (! defined($self->{column_widths}[$ndx]) ||
      $width > $self->{column_widths}[$ndx]) {
    $self->{column_widths}[$ndx] = $width;
  }
}


sub table_headers {
  my ($self) = @_;

  my $header_style = ($self->{header_style}) ?
    " style=\"$self->{header_style}\"" : '';

  $self->{html} .= "<tr>\n";
  for (my $i = 0; $i < scalar(@{$self->{headers}}); $i++) {
    $self->{html} .= "  <th" . $header_style . ">$self->{headers}[$i]</th>\n";
    $self->{text} .= sprintf("%-$self->{column_widths}[$i]s",
      $self->{headers}[$i]);
    $self->{text} .= ' ' x $self->{column_separator};
  }
  $self->{html} .= "</tr>\n";
  $self->{text} =~ s/\s+$//;
  $self->{text} .= "\n";

  for (my $i = 0; $i < scalar(@{$self->{headers}}); $i++) {
    $self->{text} .= '-' x $self->{column_widths}[$i] .
      ' ' x $self->{column_separator};
  }
  $self->{text} =~ s/\s+$//;
  $self->{text} .= "\n";
}


sub table_rows {
  my ($self) = @_;

  my @row_style = ();

  push(@row_style, ($self->{odd_row_style})
    ? " style=\"$self->{odd_row_style}\"" : '');
  push(@row_style, ($self->{even_row_style})
    ? " style=\"$self->{even_row_style}\"" : '');

  my $pos = 0;
  foreach my $row (@{$self->{rows}}) {
    $self->{html} .= "<tr" . $row_style[$pos] . ">";
    $pos++;
    $pos %= 2;

    for (my $i = 0; $i < scalar(@$row); $i++) {
      $self->{html} .= "<td>$row->[$i]</td>";
      $self->{text} .= sprintf("%-$self->{column_widths}[$i]s", $row->[$i]);
      $self->{text} .= ' ' x $self->{column_separator};
    }
    $self->{html} .= "</tr>\n";
    $self->{text} =~ s/\s+$//;
    $self->{text} .= "\n";
  }
}


1;
