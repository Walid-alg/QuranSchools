object DataModule4: TDataModule4
  Height = 471
  Width = 614
  PixelsPerInch = 120
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Projects\Delphi\QuranSchools\School.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 448
    Top = 16
  end
  object FDTable1: TFDTable
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'Students'
    Left = 56
    Top = 32
    object FDTable1id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object FDTable1first_name: TWideMemoField
      FieldName = 'first_name'
      Origin = 'first_name'
      Required = True
      BlobType = ftWideMemo
    end
    object FDTable1last_name: TWideMemoField
      FieldName = 'last_name'
      Origin = 'last_name'
      Required = True
      BlobType = ftWideMemo
    end
    object FDTable1birth_date: TDateField
      FieldName = 'birth_date'
      Origin = 'birth_date'
    end
    object FDTable1age: TIntegerField
      FieldName = 'age'
      Origin = 'age'
    end
    object FDTable1address: TWideMemoField
      FieldName = 'address'
      Origin = 'address'
      BlobType = ftWideMemo
    end
    object FDTable1gender: TWideMemoField
      FieldName = 'gender'
      Origin = 'gender'
      BlobType = ftWideMemo
    end
    object FDTable1phone: TWideMemoField
      FieldName = 'phone'
      Origin = 'phone'
      BlobType = ftWideMemo
    end
    object FDTable1enrollment_date: TDateField
      FieldName = 'enrollment_date'
      Origin = 'enrollment_date'
    end
    object FDTable1level: TWideMemoField
      FieldName = 'level'
      Origin = 'level'
      BlobType = ftWideMemo
    end
    object FDTable1guardian_id: TIntegerField
      FieldName = 'guardian_id'
      Origin = 'guardian_id'
    end
    object FDTable1teacher_id: TIntegerField
      FieldName = 'teacher_id'
      Origin = 'teacher_id'
    end
    object FDTable1email: TWideMemoField
      FieldName = 'email'
      Origin = 'email'
      BlobType = ftWideMemo
    end
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 448
    Top = 200
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 448
    Top = 104
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from students')
    Left = 200
    Top = 32
  end
  object FDTable2: TFDTable
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'Teachers'
    Left = 56
    Top = 112
    object FDTable2id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object FDTable2first_name: TWideMemoField
      FieldName = 'first_name'
      Origin = 'first_name'
      Required = True
      BlobType = ftWideMemo
    end
    object FDTable2last_name: TWideMemoField
      FieldName = 'last_name'
      Origin = 'last_name'
      Required = True
      BlobType = ftWideMemo
    end
    object FDTable2address: TWideMemoField
      FieldName = 'address'
      Origin = 'address'
      BlobType = ftWideMemo
    end
    object FDTable2phone: TWideMemoField
      FieldName = 'phone'
      Origin = 'phone'
      BlobType = ftWideMemo
    end
    object FDTable2email: TWideMemoField
      FieldName = 'email'
      Origin = 'email'
      BlobType = ftWideMemo
    end
    object FDTable2specialization_id: TIntegerField
      FieldName = 'specialization_id'
      Origin = 'specialization_id'
    end
  end
  object FDTable3: TFDTable
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'Guardians'
    Left = 56
    Top = 200
    object FDTable3id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object FDTable3first_name: TWideMemoField
      FieldName = 'first_name'
      Origin = 'first_name'
      Required = True
      BlobType = ftWideMemo
    end
    object FDTable3last_name: TWideMemoField
      FieldName = 'last_name'
      Origin = 'last_name'
      Required = True
      BlobType = ftWideMemo
    end
    object FDTable3relationship: TWideMemoField
      FieldName = 'relationship'
      Origin = 'relationship'
      BlobType = ftWideMemo
    end
    object FDTable3address: TWideMemoField
      FieldName = 'address'
      Origin = 'address'
      BlobType = ftWideMemo
    end
    object FDTable3phone: TWideMemoField
      FieldName = 'phone'
      Origin = 'phone'
      BlobType = ftWideMemo
    end
    object FDTable3email: TWideMemoField
      FieldName = 'email'
      Origin = 'email'
      BlobType = ftWideMemo
    end
  end
  object FDTable4: TFDTable
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'Specializations'
    Left = 48
    Top = 304
  end
end
